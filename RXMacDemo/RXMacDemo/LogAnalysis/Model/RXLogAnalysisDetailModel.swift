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
                let event_id: String = self.getValue(listModel: listModel, key: "event_id", row: row)
                let tmpEventName: String? = RXLogAnalysisManager.sharedInstance.eventMapping[event_id]
                if tmpEventName != nil {
                    self.event_id_name = tmpEventName!
                    if event_id.elementsEqual("app_kid_classroom_lightning_VKRoomServiceManager_query_roomEvent") {
                        let e_level: String = self.getValue(listModel: listModel, key: "e_level", row: row)
                        if e_level.elementsEqual("info") {
                            self.event_id_name = tmpEventName! + "成功"
                        } else if e_level.elementsEqual("error") {
                            self.event_id_name = tmpEventName! + "失败"
                        } else {
                            // Do Nothing
                        }
                    }
                } else {
                    self.event_id_name = "未描述"
                }
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
}
