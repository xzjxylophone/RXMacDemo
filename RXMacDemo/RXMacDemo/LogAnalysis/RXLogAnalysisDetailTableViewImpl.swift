//
//  RXLogAnalysisDetailTableViewImpl.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisDetailTableViewImpl: NSObject, NSTableViewDelegate, NSTableViewDataSource {
    var dataArray: [RXLogAnalysisDetailModel] = []
    weak var tableView: NSTableView? = nil {
        willSet {
            self.tableView?.delegate = nil
            self.tableView?.dataSource = nil
        }
        didSet {
            self.tableView?.delegate = self
            self.tableView?.dataSource = self
            self.setupTableView()
        }
    }
    
    func setupTableView() {
        
    }
    
    // MARK: - NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataArray.count
    }
}
