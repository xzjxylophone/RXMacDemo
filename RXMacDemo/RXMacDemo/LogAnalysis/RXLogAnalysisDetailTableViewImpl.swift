//
//  RXLogAnalysisDetailTableViewImpl.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisDetailTableViewImpl: NSObject, NSTableViewDelegate, NSTableViewDataSource {
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
        self.tableView?.reloadData();
        
        let tableColumnArray: [NSTableColumn] = self.tableView?.tableColumns ?? []
        for tableColumn in tableColumnArray {
            self.tableView?.removeTableColumn(tableColumn)
        }
        
        for key in listModel.showPropertyNames {
            let tableColumn: NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(key))
            tableColumn.title = key
            let configModel: RXLognalysisConfigModel = RXLogAnalysisManager.sharedInstance.configModel(key: key)
            tableColumn.minWidth = CGFloat(configModel.width);
            tableColumn.isEditable = false
            self.tableView?.addTableColumn(tableColumn)
        }
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
        return model.getValue(listModel: listModel, key: key)
    }
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        if cell is NSTextFieldCell {
            let textFieldCell:NSTextFieldCell = cell as! NSTextFieldCell
            textFieldCell.font = NSFont.systemFont(ofSize: 17)
        }
    }
}
