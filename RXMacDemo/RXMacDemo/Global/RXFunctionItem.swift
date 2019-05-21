//
//  RXFunctionItem.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXFunctionItem: NSObject {
    
    var title: String = ""
    var action: String = ""
    var tag: Int = 0
    
    init(title: String, action: String, tag: Int) {
        self.title = title
        self.action = action
        self.tag = tag
    }
    
    // https://swifter.tips/init-keywords/
    convenience init(title: String, action: String) {
        self.init(title: title, action: action, tag: 0)
    }

}
