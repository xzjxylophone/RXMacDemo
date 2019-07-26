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
            path = "/Users/rush/Documents/work/workflow/20190530_100/16_29"
            path = "/Users/rush/Documents/work/workflow/20190530_100/33_40"
            path = "/Users/rush/Documents/work/workflow/20190530_100/42_52"
            path = "/Users/rush/Documents/work/workflow/20190531_100/139_148"
            path = "/Users/rush/Documents/work/workflow/20190531_100/149_188"
            path = "/Users/rush/Documents/work/workflow/20190531_100/128_132"
            path = "/Users/rush/Documents/work/workflow/20190601"
            path = "/Users/rush/Documents/work/workflow/20190606"
            path = "/Users/rush/Documents/work/workflow/20190607"
            path = "/Users/rush/Documents/work/workflow/20190606/14858434"
            path = "/Users/rush/Documents/work/workflow/20190612/34583288"
            path = "/Users/rush/Documents/work/workflow/20190612_2"
            path = "/Users/rush/Documents/work/workflow/20190617"
            path = "/Users/rush/Documents/work/workflow/20190618"
            path = "/Users/rush/Documents/work/workflow/20190620"
            path = "/Users/rush/Documents/work/workflow/20190626/61-65"
            path = "/Users/rush/Documents/work/workflow/20190627"
            path = "/Users/rush/Documents/work/workflow/20190628"
            path = "/Users/rush/Documents/work/workflow/201907/01"
            path = "/Users/rush/Documents/work/workflow/201907/05"
            path = "/Users/rush/Documents/work/workflow/201907/05_02"
            path = "/Users/rush/Documents/work/workflow/201907/09"
            path = "/Users/rush/Documents/work/workflow/201907/11"
            path = "/Users/rush/Documents/work/workflow/201907/12"
            path = "/Users/rush/Documents/work/workflow/201907/15"
            path = "/Users/rush/Documents/work/workflow/sum"
            
            
            self?.listImpl.load(path: path)
            // TODO loading view
            DispatchQueue.main.sync {
                self?.listImpl.tableView?.reloadData()
                self?.listImpl.showDetail(index: 0)
            }
        }
        
        
        
        
    }
    
}
