//
//  RXLAColumnRowViewController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLAColumnRowViewController: NSViewController {

    let columnImpl: RXLAFunctionColumnImpl = RXLAFunctionColumnImpl()
    let rowImpl: RXLAFunctionRowImpl = RXLAFunctionRowImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        self.columnImpl.setup()
        self.rowImpl.setup()
        
        self.view.addSubview(self.columnImpl.scrollView)
        self.view.addSubview(self.rowImpl.scrollView)
        
       
        self.columnImpl.scrollView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view).multipliedBy(0.3)
            make.left.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        self.rowImpl.scrollView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(0)
            make.left.equalTo(self.columnImpl.scrollView.snp.right).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
        }
    }
    
    
    func reload(listModel: RXLogAnalysisListModel) {
        self.columnImpl.dataDic = listModel.showColumnDic
        self.rowImpl.dataDic = listModel.showRowDic
        self.columnImpl.tableView.reloadData()
        self.rowImpl.tableView.reloadData()
    }
}
