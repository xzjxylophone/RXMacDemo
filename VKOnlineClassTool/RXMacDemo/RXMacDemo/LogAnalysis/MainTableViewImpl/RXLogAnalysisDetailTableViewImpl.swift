//
//  RXLogAnalysisDetailTableViewImpl.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisDetailTableViewImpl: NSObject, NSTableViewDelegate, NSTableViewDataSource, RXLogAnalysisFunctionViewDelegate {
    var listModel: RXLogAnalysisListModel = RXLogAnalysisListModel()
    var dataArray: [RXLogAnalysisDetailModel] = []
    weak var tableView: NSTableView? = nil {
        willSet {
            self.tableView?.delegate = nil
            self.tableView?.dataSource = nil
        }
        didSet {
            self.setupTableView()
        }
    }
    
    func setupTableView() {
        
        self.tableView?.usesAlternatingRowBackgroundColors = true
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.allowsColumnResizing = true
        
        
        
        
        let tableColumn = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("description"))
        self.tableView?.addTableColumn(tableColumn)
    }
    
    func reload(listModel: RXLogAnalysisListModel) {
        self.listModel = listModel
        self.dataArray = listModel.items
        self.reload()
    }
    
    func reload() {
        let tableColumnArray: [NSTableColumn] = self.tableView?.tableColumns ?? []
        for tableColumn in tableColumnArray {
            self.tableView?.removeTableColumn(tableColumn)
        }
        
//        let showKeys: [String] = listModel.showColumnArray
        let showKeys: [String] = listModel.showAllColumnArray
        
        for key in showKeys {
            let tableColumn: NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(key))
            tableColumn.title = key
            let configModel: RXLognalysisConfigModel = RXLogAnalysisManager.sharedInstance.configModel(key: key)
            tableColumn.minWidth = 100;
            tableColumn.maxWidth = CGFloat(configModel.width * 2);
            tableColumn.width = CGFloat(configModel.width);
            //            tableColumn.isEditable = false
            self.tableView?.addTableColumn(tableColumn)
        }
        self.tableView?.reloadData()
    }
    
    // MARK: - NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let key: String = (tableColumn?.identifier.rawValue)!
        let model: RXLogAnalysisDetailModel = self.dataArray[row]
        return model.getValue(listModel: listModel, key: key, row: row)
    }
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        if cell is NSTextFieldCell {
            let textFieldCell:NSTextFieldCell = cell as! NSTextFieldCell
            textFieldCell.font = NSFont.systemFont(ofSize: 17)
        }
    }
    
    // MARK: RXLogAnalysisFunctionViewDelegate
    func enterLeaveRoomAction() {
        self.dataArray = self.listModel.getEnterLeaveRoomItems()
        self.reload()
    }
    func audioVideoAction() {
        self.dataArray = self.listModel.getAudioVideoItems()
        self.reload()
    }
    func vkPPTAction() {
        self.dataArray = self.listModel.getVKPPTAction()
        self.reload()
    }
    func dbPPTAction() {
        self.dataArray = self.listModel.getDBPPTAction()
        self.reload()
    }
    func allAction() {
        self.dataArray = self.listModel.items
        self.reload()
    }
    
    func inClassAction() {
        self.dataArray = self.listModel.getInClassItems()
        self.reload()
    }
    func gossipAction() {
        self.dataArray = self.listModel.getGossipItems()
        self.reload()
    }
    func outClassAction() {
        self.dataArray = self.listModel.getOutClassItems()
        self.reload()
    }
    func jkClassAction() {
        self.dataArray = self.listModel.getJkClassItems()
        self.reload()
    }
    func audioAction() {
        self.dataArray = self.listModel.getAudioItems()
        self.reload()
    }
    func gestureAction() {
        self.dataArray = self.listModel.getGestureItems()
        self.reload()
    }
    func reloadOrTerminateAction() {
        self.dataArray = self.listModel.getReloadOrTerminateItems()
        self.reload()
    }
    
}
