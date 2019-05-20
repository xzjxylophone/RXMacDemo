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

    
    // MARK: - NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let key: String = self.dataArray[row]
        return key
    }
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        if cell is NSTextFieldCell {
            let textFieldCell:NSTextFieldCell = cell as! NSTextFieldCell
            textFieldCell.font = NSFont.systemFont(ofSize: 17)
        }
    }
    
    
}
