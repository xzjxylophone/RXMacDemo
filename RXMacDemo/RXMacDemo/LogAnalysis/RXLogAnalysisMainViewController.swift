//
//  RXLogAnalysisMainViewController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisMainViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet weak var listScrollView: NSScrollView?
    @IBOutlet weak var listTableView: NSTableView?
    @IBOutlet weak var detailTableView: NSTableView?
    @IBOutlet weak var detailScrollView: NSScrollView?

    let tableViewData = [["firstName":"John","lastName":"Doe","emailId":"john.doe@knowstack.com"],["firstName":"Jane","lastName":"Doe","emailId":"jane.doe@knowstack.com"]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
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
        
        return tableViewData[row][(tableColumn?.identifier.rawValue)!]
    }
    
}
