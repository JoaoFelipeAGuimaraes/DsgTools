# -*- coding: utf-8 -*-
"""
/***************************************************************************
 DsgTools
                                 A QGIS plugin
 Brazilian Army Cartographic Production Tools
                              -------------------
        begin                : 2014-11-08
        git sha              : $Format:%H$
        copyright            : (C) 2014 by Luiz Andrade - Cartographic Engineer @ Brazilian Army
        email                : luiz.claudio@dsg.eb.mil.br
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""
import os
from uuid import uuid4

# Import the PyQt and QGIS libraries
from PyQt4 import uic, QtGui, QtCore
from PyQt4.QtCore import Qt, SIGNAL
from PyQt4.QtGui import QStyledItemDelegate, QComboBox, QItemDelegate, QDialog, QMessageBox, QListWidget, QListWidgetItem
from PyQt4.QtSql import QSqlTableModel, QSqlDatabase, QSqlQuery

#DsgTools imports
from DsgTools.QmlTools.qmlParser import QmlParser
from DsgTools.Factories.DbFactory.abstractDb import AbstractDb

FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'ui_manageComplex.ui'))

class CustomTableModel(QSqlTableModel):
    def __init__(self, domainDict, parent=None, db=QSqlDatabase):
        QSqlTableModel.__init__(self, parent=parent, db=db)
        self.dict = domainDict

    def flags(self, index):
        if index.column() == 0:
            return Qt.ItemIsEnabled | Qt.ItemIsSelectable
        return Qt.ItemIsEditable | Qt.ItemIsEnabled | Qt.ItemIsSelectable

    def data(self, index, role):
        code = QSqlTableModel.data(self, index, role)
        column = self.headerData(index.column(), Qt.Horizontal)
        if self.dict.has_key(column):
            dict = self.dict[column]
            if str(code) in dict.values():
                id = dict.values().index(str(code))
                return dict.keys()[id]
        return code

    def setData(self, index, value, role=Qt.EditRole):
        column = self.headerData(index.column(), Qt.Horizontal)
        newValue = value
        if self.dict.has_key(column):
            dict = self.dict[column]
            newValue = int(dict[value])
        return QSqlTableModel.setData(self, index, newValue, role)

class ComboBoxDelegate(QStyledItemDelegate):
    def __init__(self, parent, itemsDict, column):
        QItemDelegate.__init__(self, parent)
        self.itemsDict = itemsDict
        self.column = column

    def createEditor(self, parent, option, index):
        # special combobox for field type
        if index.column() == self.column:
            cbo = QComboBox(parent)
            for item in self.itemsDict:
                cbo.addItem(item, self.itemsDict[item])
            return cbo
        return QItemDelegate.createEditor(self, parent, option, index)

    def setEditorData(self, editor, index):
        """ load data from model to editor """
        m = index.model()
        try:
            if index.column() == self.column:
                txt = m.data(index, Qt.DisplayRole)
                editor.setEditText(txt)
            else:
                # use default
                QItemDelegate.setEditorData(self, editor, index)
        except:
            pass

    def setModelData(self, editor, model, index):
        """ save data from editor back to model """
        if index.column() == self.column:
            model.setData(index, editor.currentText())
        else:
            # use default
            QItemDelegate.setModelData(self, editor, model, index)

class ListWidgetDelegate(QStyledItemDelegate):
    def __init__(self, parent, itemsDict, column):
        QItemDelegate.__init__(self, parent)
        self.itemsDict = itemsDict
        self.column = column

    def createEditor(self, parent, option, index):
        # special combobox for field type
        if index.column() == self.column:
            list = QListWidget(parent)
            for item in self.itemsDict:
                listItem = QListWidgetItem(item)
                listItem.setData(Qt.UserRole, self.itemsDict[item])
                listItem.setCheckState(Qt.Unchecked)
                list.addItem(listItem)
            return list
        return QItemDelegate.createEditor(self, parent, option, index)

    def setEditorData(self, editor, index):
        """ load data from model to editor """
        m = index.model()
        try:
            if index.column() == self.column:
                txt = m.data(index, Qt.DisplayRole)
                checkList = str(txt)[1:-1].split(',')
                for i in range(editor.count()):
                    item = editor.item(i)
                    item.setCheckState(Qt.Checked if str(item.text()) in checkList else Qt.Unchecked)
            else:
                # use default
                QItemDelegate.setEditorData(self, editor, index)
        except:
            pass

    def setModelData(self, editor, model, index):
        """ save data from editor back to model """
        if index.column() == self.column:
            checkedItems = []
            for i in range(editor.count()):
                item = editor.item(i)
                if item.checkState() == Qt.Checked:
                    checkedItems.append(item.text())
            model.setData(index, '(%s)' % ','.join(map(str, checkedItems)))
        else:
            # use default
            QItemDelegate.setModelData(self, editor, model, index)

class ManageComplexDialog(QDialog, FORM_CLASS):
    def __init__(self, iface, abstractDb, table):
        """Constructor.
        """
        QDialog.__init__( self )
        self.setupUi( self )

        #qgis interface
        self.iface = iface

        #database conenction
        self.db = abstractDb.db
        #table name
        self.table = table
        #rows that are marked for removal
        self.toBeRemoved = []

        #adjusting the table name to match the correspondent qml file
        fileName = table.replace('complexos_', '')
        fileName = fileName.split('.')[-1]+'.qml'

        #obtaining the qml file path
        qmlDirPath = abstractDb.getQmlDir()
        qmlPath = os.path.join(qmlDirPath, fileName)

        #getting the domain dictionary that will be used to generate the comboboxes
        try:
            parser = QmlParser(qmlPath)
            self.domainDict = parser.getDomainDict()
        except:
            self.domainDict = dict()
            pass
        
        self.addRow.clicked.connect(self.addComplex)
        self.removeRow.clicked.connect(self.removeComplex)
        self.updateButton.clicked.connect(self.updateTable)
        self.cancelButton.clicked.connect(self.cancel)

        self.updateTableView()

    def generateDelegates(self):
        for key in self.domainDict:
            if isinstance(self.domainDict[key], dict):
                self.generateCombo(key, self.domainDict[key])
            elif isinstance(self.domainDict[key], list):
                self.generateList(key, self.domainDict[key])

    def generateCombo(self, column, domainValues):
        combo = ComboBoxDelegate(self, domainValues, self.projectModel.fieldIndex(column))
        self.tableView.setItemDelegateForColumn(self.projectModel.fieldIndex(column), combo)

    def generateList(self, column, codes):
        valueRelation = self.makeValueRelationDict(codes)
        list = ListWidgetDelegate(self, valueRelation, self.projectModel.fieldIndex(column))
        self.tableView.setItemDelegateForColumn(self.projectModel.fieldIndex(column), list)

    def makeValueRelationDict(self, codes):
        ret = dict()

        in_clause = '(%s)' % ",".join(map(str, codes))

        query = QSqlQuery('select code, code_name from dominios.%s where code in %s' % (self.table, in_clause), self.db)
        while query.next():
            code = query.value(0)
            code_name = query.value(1)
            ret[code_name] = code

        return {'um':1, 'dois':2, 'tres':3, 'quatro':4, 'cinco':5}

    def updateTableView(self):
        #setting the model in the view
        self.projectModel = CustomTableModel(self.domainDict, None, self.db)
        #adjusting the table
        self.projectModel.setTable(self.table)
        #manual commit rule
        self.projectModel.setEditStrategy(QSqlTableModel.OnManualSubmit)
        #selecting all item from the table
        self.projectModel.select()
        #creating the comboboxes and listwidgets to map the domain values
        self.generateDelegates()

        #case the first record is null we make some adjustments
        #this is not supposed to happen
        record = self.projectModel.record(0)
        if not record.value("id"):
            adjustedRecord = self.adjustRecord(record)
            self.projectModel.setRecord(0, adjustedRecord)

        self.tableView.setModel(self.projectModel)

        #Hiding columns that point to other complexes so that the user can't change them
        for i in range(self.projectModel.columnCount()):
            columnName = self.projectModel.headerData(i, Qt.Horizontal)
            if 'id_' in columnName:
                self.tableView.hideColumn(i)

        self.tableView.show()

    def addComplex(self):
        record = self.projectModel.record()
        adjustedRecord = self.adjustRecord(record)
        self.projectModel.insertRecord(self.projectModel.rowCount(), adjustedRecord)

    def adjustRecord(self,record):
        #insert a new record with an already determined uuid value
        record.setValue("id",str(uuid4()))
        record.setValue("nome", self.tr("edit this field"))
        for i in range(self.projectModel.columnCount()):
            columnName = self.projectModel.headerData(i, Qt.Horizontal)
            if self.domainDict.has_key(columnName):
                record.setValue(columnName, self.tr("edit this field"))
        return record

    def removeComplex(self):
        #getting the selected rows
        selectionModel = self.tableView.selectionModel()
        selectedRows = selectionModel.selectedRows()
        for row in selectedRows:
            #storing the complex to be removed
            record = self.projectModel.record(row.row())
            uuid = str(record.value("id"))
            if uuid not in self.toBeRemoved:
                self.toBeRemoved.append(uuid)
            self.projectModel.removeRow(row.row())

    def cancel(self):
        self.done(0)

    def checkComplexNameField(self):
        count = self.projectModel.rowCount()
        for i in range(count):
            record = self.projectModel.record(i)
            if record.isNull('nome'):
                QMessageBox.warning(self.iface.mainWindow(), self.tr("Warning!"), self.tr('The field: \'nome\' must be filled in all rows. Please, check and try again.'))
                return False
        return True

    def updateTable(self):
        #checking if the name field is filled
        #Now the database checks the field "nome", therefore the method checkComplexNameField() is no longer needed

        #emit the signal to disassocite all features from the complexes marked for removal
        self.emit(SIGNAL("markedToRemove( PyQt_PyObject )"), self.toBeRemoved)
        #commmiting all pending changes
        if not self.projectModel.submitAll():
            #In case something went wrong we show the message to the user
            QMessageBox.warning(self.iface.mainWindow(), self.tr("Error!"), self.projectModel.lastError().text())

        #Emit the signal to update the complex tree
        self.emit( SIGNAL( "tableUpdated()" ))