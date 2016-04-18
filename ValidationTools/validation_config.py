# -*- coding: utf-8 -*-
"""
/***************************************************************************
 DsgTools
                                 A QGIS plugin
 Brazilian Army Cartographic Production Tools
                              -------------------
        begin                : 2016-02-18
        git sha              : $Format:%H$
        copyright            : (C) 2016 by Philipe Borba - Cartographic Engineer @ Brazilian Army
        email                : borba@dsg.eb.mil.br
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

from PyQt4 import QtGui, uic
from PyQt4.QtCore import *

from DsgTools.ValidationTools.setupEarthCoverage import SetupEarthCoverage

FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'validation_config.ui'))

class ValidationConfig(QtGui.QDialog, FORM_CLASS):
    def __init__(self, parent=None):
        '''Constructor.'''
        super(ValidationConfig, self).__init__(parent)
        # Set up the user interface from Designer.
        # After setupUI you can access any designer object by doing
        # self.<objectname>, and you can use autoconnect slots - see
        # http://qt-project.org/doc/qt-4.8/designer-using-a-ui-file.html
        # #widgets-and-dialogs-with-auto-connect
        self.setupUi(self)
        self.widget.tabWidget.setTabEnabled(1,True)
        self.widget.tabWidget.setTabEnabled(0,False)
        self.widget.tabWidget.setCurrentIndex(1)

    @pyqtSlot(bool)
    def on_closePushButton_clicked(self):
        self.hide()

    @pyqtSlot(bool)
    def on_defineEarthCoverageButton_clicked(self):
        if not self.widget.abstractDb:
            QMessageBox.critical(self, self.tr('Critical!'), self.tr('Select a database to manage earth coverage'))
            return
        dlg = SetupEarthCoverage(self.widget.abstractDb)
        dlg.exec_()
        pass    