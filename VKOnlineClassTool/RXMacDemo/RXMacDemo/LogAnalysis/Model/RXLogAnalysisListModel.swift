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
    
    var items: [RXLogAnalysisDetailModel] = [] {
        didSet {
            for model in self.items {
                // 这里不能直接使用self.event_id,还没有完全解析数据了
                let key = model.getValue(listModel: self, key: "event_id", row: 0)
                let value: Bool? = self.showRowDic[key]
                if value == nil {
                    self.showRowDic[key] = true
                }
            }
        }
    }
    
    // 获取所有进入教室的事件
    var enterLeaveRoomItems: [RXLogAnalysisDetailModel] = []
    func getEnterLeaveRoomItems() -> [RXLogAnalysisDetailModel] {
        if self.enterLeaveRoomItems.count == 0 {
            for item in self.items {
                let event_id: String = item.getValue(key: "event_id", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.enterLeaveRoom)[event_id]
                if value != nil {
                    self.enterLeaveRoomItems.append(item)
                }
            }
        }
        return self.enterLeaveRoomItems
    }
    
    
    // 获取所有音视频测速的事件
    var audioVideoItems: [RXLogAnalysisDetailModel] = []
    func getAudioVideoItems() -> [RXLogAnalysisDetailModel] {
        if self.audioVideoItems.count == 0 {
            for item in self.items {
                let event_id: String = item.getValue(key: "event_id", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.audio_video)[event_id]
                if value != nil {
                    self.audioVideoItems.append(item)
                }
            }
        }
        return self.audioVideoItems
    }
    
    // 获取所有VKPPT的事件
    var vkPPTItems: [RXLogAnalysisDetailModel] = []
    func getVKPPTAction() -> [RXLogAnalysisDetailModel] {
        if self.vkPPTItems.count == 0 {
            for item in self.items {
                let event_id: String = item.getValue(key: "event_id", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.vk_ppt)[event_id]
                if value != nil {
                    self.vkPPTItems.append(item)
                }
            }
        }
        return self.vkPPTItems
    }
    
    
    // 获取所有多贝PPT的事件
    var dbPPTItems: [RXLogAnalysisDetailModel] = []
    func getDBPPTAction() -> [RXLogAnalysisDetailModel] {
        if self.dbPPTItems.count == 0 {
            for item in self.items {
                let event_id: String = item.getValue(key: "event_id", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.db_ppt)[event_id]
                if value != nil {
                    self.dbPPTItems.append(item)
                }
            }
        }
        return self.dbPPTItems
    }
    
    // 获取所有教室内事件
    var inClassItems: [RXLogAnalysisDetailModel] = []
    func getInClassItems() -> [RXLogAnalysisDetailModel] {
        if self.inClassItems.count == 0 {
            for item in self.items {
                let app_class_id: String = item.getValue(key: "app_class_id", keys: self.keys)
                let event_id: String = item.getValue(key: "event_id", keys: self.keys)
                if app_class_id.count > 0 && event_id.count > 0 {
                    self.inClassItems.append(item)
                }
            }
        }
        return self.inClassItems
    }
    
    // 获取所有教室外事件
    var outClassItems: [RXLogAnalysisDetailModel] = []
    func getOutClassItems() -> [RXLogAnalysisDetailModel] {
        if self.outClassItems.count == 0 {
            for item in self.items {
                let app_class_id: String = item.getValue(key: "app_class_id", keys: self.keys)
                let event: String = item.getValue(key: "event", keys: self.keys)
                if app_class_id.count == 0 && event.hasPrefix("app_") {
                    self.outClassItems.append(item)
                }
            }
        }
        return self.outClassItems
    }
    
    // 获取所有监课事件
    var jkClassItems: [RXLogAnalysisDetailModel] = []
    func getJkClassItems() -> [RXLogAnalysisDetailModel] {
        if self.jkClassItems.count == 0 {
            for item in self.items {
                let event: String = item.getValue(key: "event", keys: self.keys)
                if event.hasPrefix("jk_") {
                    self.jkClassItems.append(item)
                }
            }
        }
        return self.jkClassItems
    }
    
    // 获取所有gossip事件
    var gossipItems: [RXLogAnalysisDetailModel] = []
    func getGossipItems() -> [RXLogAnalysisDetailModel] {
        if self.gossipItems.count == 0 {
            for item in self.items {
                let event_id: String = item.getValue(key: "event_id", keys: self.keys)
                if event_id.hasPrefix("app_kid_classroom_lightning_VKRoomServiceManager_query_roomEvent") {
                    self.gossipItems.append(item)
                }
            }
        }
        return self.gossipItems
    }
    
    // 音频相关
    var audioItems: [RXLogAnalysisDetailModel] = []
    func getAudioItems() -> [RXLogAnalysisDetailModel] {
        if self.audioItems.count == 0 {
            for item in self.items {
                let event: String = item.getValue(key: "event", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.audio)[event]
                if value != nil {
                    self.audioItems.append(item)
                }
            }
        }
        return self.audioItems
    }
    // 手势识别相关
    var gestureItems: [RXLogAnalysisDetailModel] = []
    func getGestureItems() -> [RXLogAnalysisDetailModel] {
        if self.gestureItems.count == 0 {
            for item in self.items {
                let event: String = item.getValue(key: "event_id", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.gesture)[event]
                if value != nil {
                    self.gestureItems.append(item)
                }
            }
        }
        return self.gestureItems
    }
    
    
    // 重启或者崩溃事件
    var reloadOrTerminateItems: [RXLogAnalysisDetailModel] = []
    func getReloadOrTerminateItems() -> [RXLogAnalysisDetailModel] {
        if self.reloadOrTerminateItems.count == 0 {
            for item in self.items {
                let event: String = item.getValue(key: "event", keys: self.keys)
                let value: Any? = RXLogAnalysisManager.sharedInstance.logTypeMapping(type: RXLogType.reloadOrTerminate)[event]
                if value != nil {
                    self.reloadOrTerminateItems.append(item)
                }
            }
        }
        return self.reloadOrTerminateItems
    }
    
    
    
    var fileFullPath: String = ""
    var fileName: String = ""
    
    
    
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
    
    // 基本信息是否加载
    var isBaseInfoLoad: Bool = false
    
    // 非空的基本信息
    let nonnullPropertyNames: [String] =
        ["date", "app_kid_id", "app_class_id", "app_room_id"]
    // 空的基本信息
    let nullablePropertyNames: [String] =
        ["app_build_version", "app_version", "os_version", "model", "province", "ip",
         "user_id", "distinct_id", "network_type", "app_teacher_id", "carrier",
         "manufacturer", "wifi", "screen_width", "screen_height", "lib", "os", "lib_version", "city", "country"]
 
    
    var showRowDic: [String: Bool] = [:]
    var showColumnDic: [String: Bool] = [:]
    // 需要显示的列表
    var showColumnArray: [String] = []
    
    var showAllColumnArray: [String] = []
    
    
    
    func setBaseInfo(values: [String]) -> Bool {
        
        if self.keys.count == 0 {
            return false
        }
        if self.keys.count != values.count {
            return false
        }
        
        self.showColumnArray = ["realIndex", "time", "event", "event_id", "event_id_name",
        "type", "e_level", "app_class_vendor", "app_class_linecode",
        "sender", "sub_sender", "module", "sub_module", "app_status_code", "app_status_description",
        "reason", "app_origin_data"]
        
        for tmp in self.showColumnArray {
            self.showColumnDic[tmp] = Bool(true)
        }
        
        
        
        for key in self.nonnullPropertyNames {
            let value: String = self.getValue(key: key, values: values, defaultValue: "")
            if (value.count == 0) {
                return false
            }
            self.setValue(value, forKey: key)
        }
        
        
        
        for key in self.nullablePropertyNames {
            let value: String = self.getValue(key: key, values: values, defaultValue: "")
            self.setValue(value, forKey: key)
        }
        self.isBaseInfoLoad = true
        
        self.showAllColumnArray.append(contentsOf: self.showColumnArray)
        self.showAllColumnArray.append(contentsOf: self.nonnullPropertyNames)
        self.showAllColumnArray.append(contentsOf: self.nullablePropertyNames)
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
    
    var wifiString: String {
        if Int(self.wifi) == 1 {
            return "WIFI"
        } else {
            return "2G/3G/4G/5G"
        }
    }
    
    override var description: String {
        var result = ""
        result += "文件名：\(self.fileName)\n"
        result += "\(self.date)--\(self.app_kid_id)\n"
        result += "\(self.app_class_id)\n"
        result += "\(self.app_room_id)\n"
        result += "\(self.app_build_version)\n"
        result += "\(self.model)--\(self.os_version)\n"
        result += "\(self.wifiString)--\(self.screen_width)X\(self.screen_height)\n"
        result += "\(self.country)--\(self.province)--\(self.city)\n"
        result += "日志条数:\(self.items.count)"
        return result
    }
    
  

}
