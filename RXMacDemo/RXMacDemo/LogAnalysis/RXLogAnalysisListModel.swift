//
//  RXLogAnalysisListModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisListModel: NSObject {
    
    var keys: [String] = [] {
        didSet {
            self.showDic = [:]
            for key in self.keys {
                self.showDic[key] = true
            }
        }
    }
    
    
    var showDic: [String: Bool] = [:]
    
    var items: [RXLogAnalysisDetailModel] = []
    
    var fileFullPath: String = ""
    
    

}
