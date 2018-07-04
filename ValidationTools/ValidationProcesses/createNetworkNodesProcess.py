# -*- coding: utf-8 -*-
"""
/***************************************************************************
 DsgTools
                                 A QGIS plugin
 Brazilian Army Cartographic Production Tools
                             -------------------
        begin                : 2018-07-03
        git sha              : $Format:%H$
        copyright            : (C) 2018 by João P. Esperidião - Cartographic Engineer @ Brazilian Army
        email                : esperidiao.joao@eb.mil.br
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

from qgis.core import QgsMessageLog, QgsVectorLayer, QgsGeometry, QgsFeature, QgsWKBTypes, QgsRectangle, \
                      QgsFeatureRequest, QgsDataSourceURI, QgsExpression
from qgis.gui import QgsMapTool
from PyQt4.QtGui import QMessageBox

import processing, binascii, math
from collections import OrderedDict
from DsgTools.ValidationTools.ValidationProcesses.validationProcess import ValidationProcess
from DsgTools.ValidationTools.ValidationProcesses.hidrographyFlowProcess import HidrographyFlowParameters
from DsgTools.GeometricTools.DsgGeometryHandler import DsgGeometryHandler

class CreateNetworkNodesProcess(ValidationProcess):
    # enum for node types
    Flag, Sink, WaterwayBegin, UpHillNode, DownHillNode, Confluence, Ramification, AttributeChange, NodeNextToWaterBody, AttributeChangeFlag, ConstantFlowNode = range(11)
    def __init__(self, postgisDb, iface, instantiating=False):
        """
        Class constructor.
        :param postgisDb: (DsgTools.AbstractDb) postgis database connection.
        :param iface: (QgisInterface) QGIS interface object.
        :param instantiating: (bool) indication of whether method is being instatiated.
        """
        super(CreateNetworkNodesProcess, self).__init__(postgisDb, iface, instantiating)
        self.processAlias = self.tr('Create Network Nodes')
        self.hidNodeLayerName = 'aux_hid_nodes_p'
        self.canvas = self.iface.mapCanvas()
        self.DsgGeometryHandler = DsgGeometryHandler(iface)
        # name for node types (check enum atop)
        self.nodeTypeNameDict = {
                                    CreateNetworkNodesProcess.Flag : self.tr("Flag"),
                                    CreateNetworkNodesProcess.Sink : self.tr("Sink"),
                                    CreateNetworkNodesProcess.WaterwayBegin : self.tr("Waterway Beginning"),
                                    CreateNetworkNodesProcess.UpHillNode : self.tr("Up Hill Node"),
                                    CreateNetworkNodesProcess.DownHillNode : self.tr("Down Hill Node"),
                                    CreateNetworkNodesProcess.Confluence : self.tr("Confluence"),
                                    CreateNetworkNodesProcess.Ramification : self.tr("Ramification"),
                                    CreateNetworkNodesProcess.AttributeChange : self.tr("Attribute Change Node"),
                                    CreateNetworkNodesProcess.NodeNextToWaterBody : self.tr("Node Next to Water Body"),
                                    CreateNetworkNodesProcess.AttributeChangeFlag : self.tr("Attribute Change Flag"),
                                    CreateNetworkNodesProcess.ConstantFlowNode : self.tr("Constant Flow Node")
                                    # CreateNetworkNodesProcess.NodeOverload : self.tr("Overloaded Node")
                                }
        if not self.instantiating:
            # getting tables with elements (line primitive)
            self.classesWithElemDict = self.abstractDb.getGeomColumnDictV2(withElements=True, excludeValidation = True)
            # adjusting process parameters
            interfaceDict = dict()
            for key in self.classesWithElemDict:
                cat, lyrName, geom, geomType, tableType = key.split(',')
                interfaceDict[key] = {
                                        self.tr('Category'):cat,
                                        self.tr('Layer Name'):lyrName,
                                        self.tr('Geometry\nColumn'):geom,
                                        self.tr('Geometry\nType'):geomType,
                                        self.tr('Layer\nType'):tableType
                                     }
            self.networkClassesWithElemDict = self.abstractDb.getGeomColumnDictV2(primitiveFilter=['l'], withElements=True, excludeValidation = True)
            networkFlowParameterList = HidrographyFlowParameters(self.networkClassesWithElemDict.keys())
            self.sinkClassesWithElemDict = self.abstractDb.getGeomColumnDictV2(primitiveFilter=['p'], withElements=True, excludeValidation = True)
            sinkFlowParameterList = HidrographyFlowParameters(self.sinkClassesWithElemDict.keys())            
            self.parameters = {
                                self.tr('Only Selected') : False,
                                self.tr('Network Layer') : networkFlowParameterList,
                                self.tr('Sink Layer') : sinkFlowParameterList,
                                self.tr('Search Radius') : 5.0,
                                self.tr('Reference and Water Body Layers'): OrderedDict( {
                                                                       'referenceDictList':{},
                                                                       'layersDictList':interfaceDict
                                                                     } ),
                              }
            self.nodeDbIdDict = None
            self.nodeDict = None
            self.nodeTypeDict = None

    def getFrameContour(self, frameLayer):
        """
        Read frame contour, frame, hidrography lines and hidrgrography node layers.
        :param frameLayer: (QgsVectorLayer) frame layer.
        :return: (list-of-QgsGeometry) frame contour for every feature in frame layer.
        """
        frame = []
        isMulti = QgsWKBTypes.isMultiType(int(frameLayer.wkbType()))
        for feat in frameLayer.getFeatures():
            frameNodes = self.DsgGeometryHandler.getFeatureNodes(frameLayer, feat)[0]
            if isMulti:
                frameNodes = frameNodes[0]
            frame.append(QgsGeometry().fromPolyline(frameNodes))
        return frame
    
    def identifyAllNodes(self, hidLineLayer):
        """
        Identifies all nodes from a given layer (or selected features of it). The result is returned as a dict of dict.
        :param hidLineLayer: target layer to which nodes identification is required.
        :return: { node_id : { start : [feature_which_starts_with_node], end : feature_which_ends_with_node } }.
        """
        nodeDict = dict()
        isMulti = QgsWKBTypes.isMultiType(int(hidLineLayer.wkbType()))
        if self.parameters['Only Selected']:
            features = hidLineLayer.selectedFeatures()
        else:
            features = [feat for feat in hidLineLayer.getFeatures()]
        for feat in features:
            nodes = self.DsgGeometryHandler.getFeatureNodes(hidLineLayer, feat)
            if nodes:
                if isMulti:
                    if len(nodes) > 1:
                        # if feat is multipart and has more than one part, a flag should be raised
                        continue # CHANGE TO RAISE FLAG
                    elif len(nodes) == 0:
                        # if no part is found, skip feature
                        continue
                    else:
                        # if feat is multipart, "nodes" is a list of list
                        nodes = nodes[0]                
                # initial node
                pInit, pEnd = nodes[0], nodes[-1]
                # filling starting node information into dictionary
                if pInit not in nodeDict.keys():
                    # if the point is not already started into dictionary, it creates a new item
                    nodeDict[pInit] = { 'start' : [], 'end' : [] }
                if feat not in nodeDict[pInit]['start']:
                    nodeDict[pInit]['start'].append(feat)                            
                # filling ending node information into dictionary
                if pEnd not in nodeDict.keys():
                    nodeDict[pEnd] = { 'start' : [], 'end' : [] }
                if feat not in nodeDict[pEnd]['end']:
                    nodeDict[pEnd]['end'].append(feat)
        return nodeDict

    def nodeOnFrame(self, node, frameLyrContourList, searchRadius):
        """
        Identify whether or not node is over the frame. Returns True if point is over the frame and false if
        node is not on frame. If identification fails, returns 'None'.
        :param node: node (QgsPoint) to be identified as over the frame layer or not.
        :param frameLyrContourList: (list-of-QgsGeometry) border line for the frame layer to be checked.
        :param searchRadius: maximum distance to frame layer such that the feature is considered touching it.
        :return: (bool) whether node is as close as searchRaius to frame contour.
        """
        qgisPoint = QgsGeometry.fromPoint(node)
        # building a buffer around node with search radius for intersection with Layer Frame
        buf = qgisPoint.buffer(searchRadius, -1).boundingBox().asWktPolygon()
        buf = QgsGeometry.fromWkt(buf)
        for frameContour in frameLyrContourList:
            if buf.intersects(frameContour):
                # it is condition enough one of the frame contours to be next to node
                return True
        return False

    def nodeNextToWaterBodies(self, node, waterBodiesLayers, searchRadius):
        """
        Identify whether or not node is next to a water body feature.
        :param node: (QgsPoint) node to be identified as over the frame layer or not.
        :param waterBodiesLayers: (list-of-QgsVectorLayer) list of layers composing the water bodies on map.
        :param searchRadius: (float) maximum distance to frame layer such that the feature is considered touching it.
        :return: (bool) whether node is as close as searchRaius to a water body element.
        """        
        qgisPoint = QgsGeometry.fromPoint(node)
        # building a buffer around node with search radius for intersection with Layer Frame
        buf = qgisPoint.buffer(searchRadius, -1).boundingBox().asWktPolygon()
        buf = QgsGeometry.fromWkt(buf)
        # building bounding box around node for feature requesting
        bbRect = QgsRectangle(node.x()-searchRadius, node.y()-searchRadius, node.x()+searchRadius, node.y()+searchRadius)
        # check if buffer intersects features from water bodies layers
        for lyr in waterBodiesLayers:
            if lyr.geometryType() == 0:
                # ignore point primitive layers
                continue
            for feat in lyr.getFeatures(QgsFeatureRequest(bbRect)):
                if buf.intersects(feat.geometry()):
                    # any feature component of a water body intersected is enough
                    return True
        return False

    def nodeIsWaterSink(self, node, waterSinkLayer, searchRadius):
        """
        Identify whether or not node is next to a water body feature. If no water sink layer is given, method returns False
        :param node: (QgsPoint) node to be identified as over the frame layer or not.
        :param waterSinkLayer: (QgsVectorLayer) layer containing the water sinks on map.
        :param searchRadius: (float) maximum distance to frame layer such that the feature is considered touching it.
        :return: (bool) whether node is as close as searchRaius to a water body element.
        """
        if not waterSinkLayer:
            return False
        qgisPoint = QgsGeometry.fromPoint(node)
        # building bounding box around node for feature requesting
        x, y = node.x(), node.y()
        bbRect = QgsRectangle(x-searchRadius, y-searchRadius, x+searchRadius, y+searchRadius)
        # check if qgisPoint (node geometry) is over a sink classified point
        for feat in waterSinkLayer.getFeatures(QgsFeatureRequest(bbRect)):
            if qgisPoint.equals(feat.geometry()):
                # any feature component of a water body intersected is enough
                return True
        return False

    def getAttributesFromFeature(self, feature, layer, fieldNames=None):
        """
        Retrieves the attributes from a given feature, except for their geometry and ID column values. If a list of
        attributes is given, method will return those attributes if found. In case no attribute is found, None will 
        :param feature: (QgsFeature) feature from which attibutes will be retrieved.
        :param layer: (QgsVectorLayer) layer containing target feature.
        :param fieldNames: (list-of-str) list of field names to be exposed.
        :return: (dict-of-object) attribute values for each attribute mapped.
        """
        # fields to be ignored
        ignoreList = []
        if not fieldNames:
            # retrieving key column name
            uri = QgsDataSourceURI(layer.dataProvider().dataSourceUri())
            keyColumn = uri.keyColumn()
            # retrieving geometry column name
            networLayerName = layer.name()
            for key in self.networkClassesWithElemDict.keys():
                if key.split(",")[1] in networLayerName:
                    self.networkClassesWithElemDict
                    geomColumn = key.split(",")[2]
                    break
            # removing attributes that are calculated OTF
            fieldNames = [f for f in layer.fields() if f.name() not in [keyColumn, geomColumn] and '_otf' not in f.name()]
        else:
            # check if all field names given are in fact fields for the layer
            layerFields = layer.fields()
            ignoreList = [field for field in fieldNames if field not in layerFields]
        return { field.name() : feature[field.name()] for field in fieldNames if field not in ignoreList }

    def attributeChangeCheck(self, node, hidLineLayer):
        """
        Checks if attribute change node is in fact an attribute change.
        :param node: (QgsPoint) node to be identified as over the frame layer or not.
        :param hidLineLayer: (QgsVectorLayer) layer containing network lines.
        :return: (bool) if lines connected to node do change attributes.
        """        
        # assuming that attribute change nodes have only 1-in 1-out lines
        lineIn = self.nodeDict[node]['end'][0]
        atrLineIn = self.getAttributesFromFeature(feature=lineIn, layer=hidLineLayer)
        lineOut = self.nodeDict[node]['start'][0]
        atrLineOut = self.getAttributesFromFeature(feature=lineOut, layer=hidLineLayer)
        # comparing their dictionary of attributes, it is decided whether they share the exact same set of attributes (fields and values)
        return atrLineIn != atrLineOut

    def nodeType(self, nodePoint, hidLineLayer, frameLyrContourList, waterBodiesLayers, searchRadius, waterSinkLayer=None):
        """
        Get the node type given all lines that flows from/to it.
        :param nodePoint: (QgsPoint) point to be classified.
        :param hidLineLayer: (QgsVectorLayer) network lines layer.        
        :param frameLyrContourList: (list-of-QgsGeometry) border line for the frame layer to be checked.
        :param searchRadius: (float) maximum distance to frame layer such that the feature is considered touching it.
        :param waterSinkLayer: (QgsVectorLayer) water sink layer.
        :return: returns the (int) point type.
        """
        dictStartingEndingLinesEntry = self.nodeDict[nodePoint]
        sizeFlowOut = len(dictStartingEndingLinesEntry['start'])
        sizeFlowIn = len(dictStartingEndingLinesEntry['end'])
        hasStartLine = bool(sizeFlowOut)
        hasEndLine = bool(sizeFlowIn)
        # "exclusive or"
        startXORendLine = (hasStartLine != hasEndLine)
        # # case 5: more than 3 lines flowing through one network line (it is forbidden as of Brazilian mapping norm EDGV)
        # if sizeFlowIn + sizeFlowOut > 3:
        #     return CreateNetworkNodesProcess.NodeOverload
        # case 1: all lines either flow in or out 
        if startXORendLine:
            # case 1.a: point is over the frame
            if self.nodeOnFrame(node=nodePoint, frameLyrContourList=frameLyrContourList, searchRadius=searchRadius):
                # case 1.a.i: waterway is flowing away from mapped area (point over the frame has one line ending line)
                if hasEndLine:
                    return CreateNetworkNodesProcess.DownHillNode
                # case 1.a.ii: waterway is flowing to mapped area (point over the frame has one line starting line)
                elif hasStartLine:
                    return CreateNetworkNodesProcess.UpHillNode
            # case 1.b: point that legitimately only flows from
            elif hasEndLine:
                # case 1.b.i
                if self.nodeNextToWaterBodies(node=nodePoint, waterBodiesLayers=waterBodiesLayers, searchRadius=searchRadius):
                    # it is considered that every free node on map is a starting node. The only valid exceptions are nodes that are
                    # next to water bodies and water sink holes
                    return CreateNetworkNodesProcess.NodeNextToWaterBody
                # case 1.b.ii: node is in fact a water sink and should be able to take an 'in' flow
                elif self.nodeIsWaterSink(node=nodePoint, waterSinkLayer=waterSinkLayer, searchRadius=searchRadius):
                    # if a node is indeed a water sink (operator has set it to a sink)
                    return CreateNetworkNodesProcess.Sink
            # case 1.c: point that legitimately only flows out
            elif hasStartLine:
                return CreateNetworkNodesProcess.WaterwayBegin
            # case 1.d: points that are not supposed to have one way flow (flags)
            return CreateNetworkNodesProcess.Flag
        elif sizeFlowIn > sizeFlowOut:
            # case 2 "confluence"
            return CreateNetworkNodesProcess.Confluence
        elif sizeFlowIn == sizeFlowOut:
            if sizeFlowIn > 1:
                # case 4.c: there's a constant flow through node, but there are more than 1 line
                return CreateNetworkNodesProcess.ConstantFlowNode
            elif self.attributeChangeCheck(node=nodePoint, hidLineLayer=hidLineLayer):
                # case 4.a: lines do change their attribute set
                return CreateNetworkNodesProcess.AttributeChange
            else:
                # case 4.b: nodes inside the network that are there as an attribute change node but lines connected
                #           to it have the same set of attributes
                return CreateNetworkNodesProcess.AttributeChangeFlag
        else:
            # case 3 "ramification"
            return CreateNetworkNodesProcess.Ramification

    def classifyAllNodes(self, hidLineLayer, frameLyrContourList, waterBodiesLayers, searchRadius, waterSinkLayer=None, nodeList=None):
        """
        Classifies all identified nodes from the hidrography line layer.
        :param hidLineLayer: (QgsVectorLayer) network lines layer.
        :param frameLyrContourList: (list-of-QgsFeature) border line for the frame layer.
        :param waterBodiesLayers: (list-of-QgsVectorLayer) list of all classes with water bodies to be compared to.
        :param searchRadius: (float) maximum distance to frame layer such that the feature is considered touching it.
        :param nodeList: a list of nodes (QgsPoint) to be classified. If not given, whole dict is going 
                         to be classified. Node MUST be in dict given, if not, it'll be ignored.
        :param waterSinkLayer: (QgsVectorLayer) water sink layer.
        :return: a (dict) dictionary of node and its node type ( { (QgsPoint)node : (int)nodeType } ). 
        """
        nodeTypeDict = dict()
        nodeKeys = self.nodeDict.keys()
        if not nodeList:
            nodeList = nodeKeys
        for node in nodeList:
            if node not in nodeKeys:
                # in case user decides to use a list of nodes to work on, given nodes that are not identified will be ignored
                continue
            nodeTypeDict[node] = self.nodeType(nodePoint=node, hidLineLayer=hidLineLayer, frameLyrContourList=frameLyrContourList, waterBodiesLayers=waterBodiesLayers, searchRadius=searchRadius, waterSinkLayer=waterSinkLayer)
        return nodeTypeDict

    def fillNodeTable(self, hidLineLayer):
        """
        Populate hidrography node layer with all nodes.
        :param hidLineLayer: (QgsVectorLayer) hidrography lines layer.
        """
        lyrName = hidLineLayer.name()
        crs = hidLineLayer.crs().authid().split(":")[1]
        for node in self.nodeDict.keys():
            # get node geometry as wkt for database loading
            nWkt = QgsGeometry().fromMultiPoint([node]).exportToWkt()
            # if node is loaded into database, the following method returns True
            if self.abstractDb.insertHidValNode(layerName=lyrName, node=nWkt, nodeType=self.nodeTypeDict[node], crs=crs):
                continue
            else:
                return False
        return True

    def loadLayer(self, layerName, uniqueLoad=True):
        """
        Load a given layer to canvas.
        :param layerName: (str) layer name to be loaded.
        :param uniqueLoad: (bool) indicates that layer will be loaded to canvas only if it is not loaded already.
        """
        try:
            return self.layerLoader.load([layerName], uniqueLoad=uniqueLoad)[layerName]
        except Exception as e:
            errorMsg = self.tr('Could not load the class {0}! (If you manually removed {0} from database, reloading QGIS/DSGTools Plugin might sort out the problem.\n').format(layerName)+':'.join(e.args)
            QMessageBox.critical(self.canvas, self.tr('Error!'), errorMsg)

    def execute(self):
        """
        Structures and executes the process.
        :return: (int) execution code.
        """
        QgsMessageLog.logMessage(self.tr('Starting ')+self.getName()+self.tr(' Process.'), "DSG Tools Plugin", QgsMessageLog.CRITICAL)
        self.startTimeCount()
        try:
            self.setStatus(self.tr('Running'), 3) #now I'm running!
            self.abstractDb.deleteProcessFlags(self.getName()) #erase previous flags
            # node type should not be calculated OTF for comparison (db data is the one perpetuated)
            # setting all method variables
            hidLineLyrKey = self.parameters[self.tr('Network Layer')]
            hidSinkLyrKey = self.parameters[self.tr('Sink Layer')]
            refKey, classesWithElemKeys = self.parameters[self.tr('Reference and Water Body Layers')]
            waterBodyClassesKeys = classesWithElemKeys
            if not refKey:
                self.setStatus(self.tr('One reference must be selected! Stopping.'), 1) #Finished
                return 1
            # preparing reference layer
            refcl = self.classesWithElemDict[refKey]
            frameLayer = self.loadLayerBeforeValidationProcess(refcl)
            # preparing hidrography lines layer
            # remake the key from standard string
            k = ('{},{},{},{},{}').format(
                                          hidLineLyrKey.split('.')[0],\
                                          hidLineLyrKey.split('.')[1].split(r' (')[0],\
                                          hidLineLyrKey.split('(')[1].split(', ')[0],\
                                          hidLineLyrKey.split('(')[1].split(', ')[1],\
                                          hidLineLyrKey.split('(')[1].split(', ')[2].replace(')', '')
                                         )
            hidcl = self.networkClassesWithElemDict[k]
            trecho_drenagem = self.loadLayerBeforeValidationProcess(hidcl)
            # preparing the list of water bodies classes
            waterBodyClasses = []
            for key in waterBodyClassesKeys:
                wbc = self.classesWithElemDict[key]
                waterBodyClasses.append(self.loadLayerBeforeValidationProcess(wbc))
            # preparing water sink layer
            if hidSinkLyrKey and hidSinkLyrKey != self.tr('Select Layer'):
                # remake the key from standard string
                k = ('{},{},{},{},{}').format(
                                          hidSinkLyrKey.split('.')[0],\
                                          hidSinkLyrKey.split('.')[1].split(r' (')[0],\
                                          hidSinkLyrKey.split('(')[1].split(', ')[0],\
                                          hidSinkLyrKey.split('(')[1].split(', ')[1],\
                                          hidSinkLyrKey.split('(')[1].split(', ')[2].replace(')', '')
                                         )
                sinkcl = self.sinkClassesWithElemDict[k]
                waterSinkLayer = self.loadLayerBeforeValidationProcess(sinkcl)
            else:
                # if no sink layer is selected, layer should be ignored
                waterSinkLayer = None
            # getting dictionaries of nodes information 
            frame = self.getFrameContour(frameLayer=frameLayer)
            self.nodeDict = self.identifyAllNodes(hidLineLayer=trecho_drenagem)
            crs = trecho_drenagem.crs().authid()
            # node layer has the same CRS as the hidrography lines layer
            nodeSrid = trecho_drenagem.crs().authid().split(':')[1]
            searchRadius = self.parameters[self.tr('Search Radius')]
            self.nodeTypeDict = self.classifyAllNodes(hidLineLayer=trecho_drenagem, frameLyrContourList=frame, waterBodiesLayers=waterBodyClasses, searchRadius=searchRadius, waterSinkLayer=waterSinkLayer)
            # check if node table and node type domain table are created on db
            if not self.abstractDb.checkIfTableExists('validation', self.hidNodeLayerName):
                # if it does not exist, it is created
                self.abstractDb.createHidNodeTable(nodeSrid)
            self.fillNodeTable(hidLineLayer=trecho_drenagem)
            # load node table into canvas
            self.loadLayer(self.hidNodeLayerName)
            msg = self.tr('Network nodes created into layer {}.').format(self.hidNodeLayerName)
            self.setStatus(msg, 1) #Finished
            return 1
        except Exception as e:
            QgsMessageLog.logMessage(': '.join(e.args), "DSG Tools Plugin", QgsMessageLog.CRITICAL)
            self.finishedWithError()
            return 0
