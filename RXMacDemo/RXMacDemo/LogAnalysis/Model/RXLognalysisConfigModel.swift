//
//  RXLognalysisConfigModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/17.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLognalysisConfigModel: NSObject {
    // 只是配置一些比较基础的信息，不做任何其他复杂的逻辑处理
    var key: String = ""
    var width: Int = 0
    
//    var action: ((String) -> String)?
    
    init(key: String) {
        self.key = key
        self.width = 100
    }
    init(key: String, width: String) {
        self.key = key
        self.width = Int.init(width) ?? 0
    }
}
