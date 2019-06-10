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
//        self.listImpl.load(path: "/Users/rush/Desktop/log_analysis")
        
//        // 这行代码,显示没有此文件
//        self.listImpl.load(path: "/Users⁩/⁨rush⁩/Documents⁩/work⁩/workflow⁩/20190521⁩")
        
        
        
        DispatchQueue.global().async { [weak self] in
            // 这行代码显示有此文件
            var path = ""
            path = "/Users/rush/Documents/work/workflow/20190521"
            path = "/Users/rush/Documents/work/workflow/20190527"
            path = "/Users/rush/Documents/work/workflow/20190529"
            self?.listImpl.load(path: path)
            // TODO loading view
            DispatchQueue.main.sync {
                self?.listImpl.tableView?.reloadData()
                self?.listImpl.showDetail(index: 0)
            }
        }
        
        
        
        
    }
    
}
