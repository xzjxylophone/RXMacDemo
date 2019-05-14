//
//  RXLogAnalysisDetailModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisDetailModel: NSObject {
    var test1: String
    var test2: String
    
    
    var values: [String] = []
    init(_values: [String]) {
        self.values = _values
        self.test1 = "1"
        self.test2 = "2"
    }
}
