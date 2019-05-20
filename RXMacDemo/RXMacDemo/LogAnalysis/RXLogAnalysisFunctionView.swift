//
//  RXLogAnalysisFunctionView.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisFunctionView: NSView {
    
    let topView: NSView = NSView()
    let columnControlScrollView: NSScrollView = NSScrollView()
    let columnControlTableView: NSTableView = NSTableView()
    let rowControlScrollView: NSScrollView = NSScrollView()
    let rowControlTableView: NSTableView = NSTableView()

    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        
        self.layer = CALayer()
        
        self.columnControlScrollView.contentView.documentView = self.columnControlTableView
        self.rowControlScrollView.contentView.documentView = self.rowControlTableView
        
        self.addSubview(self.topView)
        self.addSubview(self.columnControlScrollView)
        self.addSubview(self.rowControlScrollView)
        
        self.topView.layer = CALayer()
        self.topView.layer?.backgroundColor = NSColor.blue.cgColor
        self.columnControlScrollView.layer?.backgroundColor = NSColor.red.cgColor
        self.rowControlScrollView.layer?.backgroundColor = NSColor.green.cgColor
        
        self.topView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.left.equalTo(self).offset(0)
            make.top.equalTo(self).offset(0)
            make.right.equalTo(self).offset(0)
        }
        
//        make.left.equalTo(self.listScrollView.snp.right).offset(0)
//        make.right.equalTo(self.functionView.snp.left).offset(0)
//        make.top.equalTo(self.view).offset(0)
//        make.bottom.equalTo(self.view).offset(0)
        
        self.columnControlScrollView.snp.makeConstraints { (make) in
            make.height.equalTo(self).multipliedBy(0.3)
            make.left.equalTo(self).offset(0)
            make.top.equalTo(self.topView.snp.bottom).offset(0)
            make.right.equalTo(self).offset(0)
        }
        
        self.rowControlScrollView.snp.makeConstraints { (make) in
            make.height.equalTo(self).multipliedBy(0.3)
            make.left.equalTo(self).offset(0)
            make.top.equalTo(self.columnControlScrollView.snp.bottom).offset(0)
            make.right.equalTo(self).offset(0)
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        
        
        
    }
    
}
