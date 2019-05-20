//
//  RXLAColumnRowViewController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLAColumnRowViewController: NSViewController {

    let columnControlScrollView: NSScrollView = NSScrollView()
    let columnControlTableView: NSTableView = NSTableView()
    let rowControlScrollView: NSScrollView = NSScrollView()
    let rowControlTableView: NSTableView = NSTableView()
    
    let columnImpl: RXLAFunctionColumnImpl = RXLAFunctionColumnImpl()
    let rowImpl: RXLAFunctionRowImpl = RXLAFunctionRowImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        
        
        self.columnControlScrollView.contentView.documentView = self.columnControlTableView
        self.rowControlScrollView.contentView.documentView = self.rowControlTableView
        
        self.columnControlTableView.delegate = self.columnImpl
        self.columnControlTableView.dataSource = self.columnImpl
        self.columnControlTableView.usesAlternatingRowBackgroundColors = true
        self.columnControlTableView.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init("column")))
        self.rowControlTableView.delegate = self.rowImpl
        self.rowControlTableView.dataSource = self.rowImpl
        self.rowControlTableView.usesAlternatingRowBackgroundColors = true
        self.rowControlTableView.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init("row")))
        
        self.view.addSubview(self.columnControlScrollView)
        self.view.addSubview(self.rowControlScrollView)
        
        self.columnControlScrollView.layer?.backgroundColor = NSColor.red.cgColor
        self.rowControlScrollView.layer?.backgroundColor = NSColor.green.cgColor
        
       
        self.columnControlScrollView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view).multipliedBy(0.3)
            make.left.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
        }
        
        self.rowControlScrollView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view).multipliedBy(0.3)
            make.left.equalTo(self.view).offset(0)
            make.top.equalTo(self.columnControlScrollView.snp.bottom).offset(0)
            make.right.equalTo(self.view).offset(0)
        }
    }
    
    
    func reload(listModel: RXLogAnalysisListModel) {
        self.columnImpl.dataDic = listModel.showColumnDic
        self.rowImpl.dataDic = listModel.showRowDic
        self.columnControlTableView.reloadData()
        self.rowControlTableView.reloadData()
    }
}
