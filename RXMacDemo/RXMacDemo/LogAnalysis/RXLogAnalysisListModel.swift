//
//  RXLogAnalysisListModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa


@objcMembers
class RXLogAnalysisListModel: NSObject {
    
    // 这个文件
    var keys: [String] = [] {
        didSet {
            self.showDic = [:]
            for key in self.keys {
                self.showDic[key] = true
            }
        }
    }
    
    // 哪些列是显示，哪些列是不显示的
    var showDic: [String: Bool] = [:]
    
//    var items: [RXLogAnalysisDetailModel] = []
    
    var fileFullPath: String = ""
    
    
    
    var date: String = ""
    var app_kid_id: String = ""
    var app_class_id: String = ""
    var app_room_id: String = ""
    
    
    var app_build_version: String = ""
    var app_version: String = ""
    var os_version: String = ""
    var model: String = ""
    var province: String = ""
    var ip: String = ""
    var user_id: String = ""
    var distinct_id: String = ""
    var network_type: String = ""
    var app_teacher_id: String = ""
    var carrier: String = ""
    var manufacturer: String = ""
    var wifi: String = ""
    var screen_width: String = ""
    var screen_height: String = ""
    var lib: String = ""
    var os: String = ""
    var lib_version: String = ""
    var city: String = ""
    var country: String = ""
    
 
    
    func setBaseInfo(values: [String]) -> Bool {
        
        if self.keys.count == 0 {
            return false
        }
        if self.keys.count != values.count {
            return false
        }
        
        let nonnullPropertyNames: [String] =
            ["date", "app_kid_id", "app_class_id", "app_room_id"]
        
        for key in nonnullPropertyNames {
            let value: String = self.getValue(key: key, values: values, defaultValue: "")
            if (value.count == 0) {
                return false
            }
            self.setValue(value, forKey: key)
        }
        
        let nullablePropertyNames: [String] =
            ["app_build_version", "app_version", "os_version", "model", "province", "ip",
             "user_id", "distinct_id", "network_type", "app_teacher_id", "carrier",
             "manufacturer", "wifi", "screen_width", "screen_height", "lib", "os", "lib_version", "city", "country"]
        
        for key in nullablePropertyNames {
            let value: String = self.getValue(key: key, values: values, defaultValue: "")
            self.setValue(value, forKey: key)
        }
        
        return true
    }
    
    func getValue(key: String, values: [String], defaultValue: String) -> String {
        if !self.keys.contains(key) {
            return defaultValue
        }
        let index: Int = self.keys.index(of: key) ?? -1
        if index < 0 && index >= values.count {
            return defaultValue
        }
        return values[index]
    }
    
  

}
