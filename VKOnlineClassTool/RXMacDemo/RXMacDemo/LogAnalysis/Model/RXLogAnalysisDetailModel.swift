//
//  RXLogAnalysisDetailModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa
@objcMembers
class RXLogAnalysisDetailModel: NSObject {
    
    var values: [String] = []
    init(_values: [String]) {
        self.values = _values
    }
    
    var realIndex: Int = 0
    
    var showKeyValueCache: [String: Any] = [:]
    
    
//    let showColumnArray: [String] = ["time", "event_id", "e_level", "app_class_vendor", "app_class_linecode", "app_status_code", "app_status_description"]
    
    var time: String = ""
    var show_time: String = ""
    var event: String = ""
    var event_id: String = ""
    var event_id_name: String = ""
    var type: String = ""
    var e_level: String = ""
    var app_class_vendor: String = ""
    var show_app_class_vendor: String = ""
    var app_class_linecode: String = ""
    var sender: String = ""
    var sub_sender: String = ""
    var module: String = ""
    var sub_module: String = ""
    var app_status_code: String = ""
    var app_status_description: String = ""
    var reason: String = ""
    var app_origin_data: String = ""
    
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
    
    
    
    func getValue(key: String, keys: [String]) -> String {
        let index: Int = keys.index(of: key) ?? -1
        if index == -1 {
            return ""
        }
        let result: String = self.values[index]
        return result;
    }
    
    func getValue(listModel: RXLogAnalysisListModel, key: String, row: Int) -> String {
        var result: String = ""
        if key.elementsEqual("realIndex") {
            return String(row) + "/" + String(self.realIndex)
        }
        else if key.elementsEqual("time") {
            if self.show_time.count == 0 {
                self.time = self.getValue(key: key, keys: listModel.keys)
                if self.time.count < 11 {
                    self.show_time = self.time
                } else {
                    let index = self.time.index(self.time.startIndex, offsetBy: 11)
                    self.show_time = String(self.time.suffix(from: index))
                }
            }
            result = self.show_time
        }
        else if key.elementsEqual("app_class_vendor") {
            if self.show_app_class_vendor.count == 0 {
                self.app_class_vendor = self.getValue(key: key, keys: listModel.keys)
                if self.app_class_vendor.count == 0 {
                    self.show_app_class_vendor = "线路为空"
                } else {
                    let vendeor: Int = Int(self.app_class_vendor) ?? -1
                    self.show_app_class_vendor = StringFromVendor(vendor: vendeor) + "(\(self.app_class_vendor))"
                }
            }
            result = self.show_app_class_vendor
        }
        else if key.elementsEqual("event_id_name") {
            if self.event_id_name.count == 0 {
                var result = self.getDescription(listModel: listModel, key: "event_id", type: RXLogType.event, row: row);
                if result.count == 0 {
                    result = self.getDescription(listModel: listModel, key: "app_status_description", type: RXLogType.configDescription, row: row);
                }
                if result.count == 0 {
                    result = "未描述"
                }
                self.event_id_name = result;
            }
            result = self.event_id_name
            
        }
        else {
            let tmp: Any? = self.value(forKey: key)
            if tmp != nil && ((self.showKeyValueCache[key] as? Bool) ?? false) {
//                print("cache data")
                result = tmp as! String
            } else {
//                print("first data")
                result = self.getValue(key: key, keys: listModel.keys)
                self.setValue(result, forKey: key)
                self.showKeyValueCache[key] = Bool(true)
            }
        }
        return result
    }
    
    
    func getDescription(listModel: RXLogAnalysisListModel, key: String, type: RXLogType, row: Int) -> String {
        var result: String = ""
        let event_id: String = self.getValue(listModel: listModel, key: key, row: row)
        let tmpEventName: String? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: type)[event_id]
        if tmpEventName != nil {
            result = tmpEventName!
            if event_id.elementsEqual("app_kid_classroom_lightning_VKRoomServiceManager_query_roomEvent") {
                let e_level: String = self.getValue(listModel: listModel, key: "e_level", row: row)
                if e_level.elementsEqual("info") {
                    result = tmpEventName! + "成功"
                } else if e_level.elementsEqual("error") {
                    result = tmpEventName! + "失败"
                } else {
                    // Do Nothing
                }
            }
        } else {
            result = ""
        }
        return result
    }
    
    
}
