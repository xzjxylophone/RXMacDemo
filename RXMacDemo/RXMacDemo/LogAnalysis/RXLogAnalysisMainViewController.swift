//
//  RXLogAnalysisMainViewController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa
import SnapKit

class RXLogAnalysisMainViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    let listScrollView: NSScrollView = NSScrollView()
    let listTableView: NSTableView = NSTableView()
    let detailScrollView: NSScrollView = NSScrollView()
    let detailTableView: NSTableView = NSTableView()

    let tableViewData = [["firstName1111":"John","lastName":"Doe","emailId":"john.doe@knowstack.com"],["firstName1111":"Jane","lastName":"Doe","emailId":"jane.doe@knowstack.com"]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.listScrollView.contentView.documentView = self.listTableView
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        self.view.addSubview(self.listScrollView)
        self.listScrollView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.left.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        self.detailScrollView.contentView.documentView = self.detailTableView
        
        
        let tableColumn = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("emailId"))
        self.listTableView.addTableColumn(tableColumn)
        

    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        //        return self.modelArray.count
        return tableViewData.count
    }
    //    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
    //        let textFieldCell: NSTextFieldCell? = cell as? NSTextFieldCell
    //        textFieldCell?.title = "3333"
    //    }
    //    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
    //        return 40
    //    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        //        let model: TTModel = self.modelArray[row]
        //        let key: String = tableColumn?.identifier.rawValue ?? ""
        //        let value = model.value(forKeyPath: key)
        //        return value
        
        let key: String = (tableColumn?.identifier.rawValue)!
        return tableViewData[row][key]
    }
    
}
