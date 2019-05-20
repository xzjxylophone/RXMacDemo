//
//  RXLogAnalysisContext.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisContext: NSObject {
    let listImpl: RXLogAnalysisListTableViewImpl = RXLogAnalysisListTableViewImpl()
    let detailImpl: RXLogAnalysisDetailTableViewImpl = RXLogAnalysisDetailTableViewImpl()
    
    weak var functionView: RXLogAnalysisFunctionView?
    
    func load() {
        self.listImpl.load(path: "/Users/rush/Desktop/log_analysis")
    }
    
}
