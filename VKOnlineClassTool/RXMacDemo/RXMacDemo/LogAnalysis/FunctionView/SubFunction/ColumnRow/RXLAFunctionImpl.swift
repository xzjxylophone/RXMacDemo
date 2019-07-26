//
//  RXLAFunctionImpl.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa



class RXLAFunctionImpl: NSObject, NSTableViewDelegate, NSTableViewDataSource {
    
    var dataDic: [String: Bool] = [:] {
        didSet {
            self.dataArray = Array(self.dataDic.keys)
        }
    }
    var dataArray: [String] = []
    
    
    var scrollView: NSScrollView = NSScrollView()
    var tableView: NSTableView = NSTableView()

    func setup() {
        self.scrollView.contentView.documentView = self.tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.usesAlternatingRowBackgroundColors = true
        
        let tableColumn: NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init("column"))
        self.tableView.addTableColumn(tableColumn)
    }
    
    // MARK: - NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell: Any? = self.tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "NSTableCellView"), owner: self)
        var resultCell: RXLAColumnRowCellView?
        if cell == nil {
            resultCell = RXLAColumnRowCellView()
            resultCell?.layer = CALayer()
            resultCell?.layer?.backgroundColor = NSColor.yellow.cgColor
        } else {
            resultCell = cell as? RXLAColumnRowCellView
        }
        return resultCell
    }
    
    
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
//        let key: String = self.dataArray[row]
//        return key
//    }
//    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
//        if cell is NSTextFieldCell {
//            let textFieldCell:NSTextFieldCell = cell as! NSTextFieldCell
//            textFieldCell.font = NSFont.systemFont(ofSize: 17)
//        }
//    }
    
    
}
