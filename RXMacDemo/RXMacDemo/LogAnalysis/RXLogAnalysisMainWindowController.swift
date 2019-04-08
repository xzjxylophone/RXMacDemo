//
//  RXLogAnalysisMainWindowController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/2.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisMainWindowController: NSWindowController {
    
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var detailTableView: NSTableView!
    @IBOutlet weak var listTableView: NSTableView!
    
    let context: RXLogAnalysisContext! = RXLogAnalysisContext()
    

    
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        RXLogAnalysisManager.sharedInstance.context = self.context
        
        self.listTableView.delegate = self.context.listImpl
        self.listTableView.dataSource = self.context.listImpl
        
        self.detailTableView.delegate = self.context.detailImpl
        self.detailTableView.dataSource = self.context.detailImpl
        
        
        
        
        
        self.context.load()
        self.listTableView.reloadData()
        self.detailTableView.reloadData()
    
        
        
    }
    
}

