//
//  RXLognalysisConfigModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/17.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLognalysisConfigModel: NSObject {
    var key: String = ""
    var width: Int = 0
    var showKey: String = ""
    
    var action: ((String) -> String)?
    
    init(key: String) {
        self.key = key
        self.width = 100
    }
    init(key: String, width: String) {
        self.key = key
        self.width = Int.init(width) ?? 0
    }
}
