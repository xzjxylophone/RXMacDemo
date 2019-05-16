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
    let functionView: RXLogAnalysisFunctionView = RXLogAnalysisFunctionView()
    
    let context: RXLogAnalysisContext = RXLogAnalysisContext()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.listScrollView.contentView.documentView = self.listTableView
        self.view.addSubview(self.listScrollView)
        self.listScrollView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.left.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        self.view.addSubview(self.functionView)
        let layer: CALayer = CALayer()
        self.functionView.layer = layer
        self.functionView.layer?.backgroundColor = NSColor.blue.cgColor
        self.functionView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.right.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        
        self.detailScrollView.contentView.documentView = self.detailTableView
        self.view.addSubview(self.detailScrollView)
        self.detailScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self.listScrollView.snp.right).offset(0)
            make.right.equalTo(self.functionView.snp.left).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        
        
        
        
        
        RXLogAnalysisManager.sharedInstance.context = context
        self.context.listImpl.tableView = self.listTableView
        self.context.detailImpl.tableView = self.detailTableView
        self.context.load()

    }
    
    
}
