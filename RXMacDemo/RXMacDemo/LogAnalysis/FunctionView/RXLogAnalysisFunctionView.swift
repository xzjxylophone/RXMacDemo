//
//  RXLogAnalysisFunctionView.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisFunctionView: NSView {
    

    var listModel: RXLogAnalysisListModel = RXLogAnalysisListModel()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        
        
        
    }
    
    func reload(listModel: RXLogAnalysisListModel) {
        self.listModel = listModel
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        
        
        
    }
    
}
