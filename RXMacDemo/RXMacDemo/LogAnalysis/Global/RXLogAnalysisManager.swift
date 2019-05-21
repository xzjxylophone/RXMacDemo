//
//  RXLogAnalysisManager.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisManager: NSObject {
    static let sharedInstance = RXLogAnalysisManager()
    
    weak var context: RXLogAnalysisContext?
    
    var configMapping:[String: Any] = [:]
    
    var eventMapping: [String: String] = [:]
    var enterLeaveRoomMapping: [String: String] = [:]
    
    override init() {
        super.init()
        self.loadConfig()
        self.loadEvent()
        self.loadEnterLeaveRoom()
    }
    func loadConfig() {
        let myStrings = self.load(path: "rx_log_config")
        for str in myStrings {
            if str.hasPrefix("//") {
                continue
            }
            let strAry = str.components(separatedBy: ",")
            if strAry.count < 2 {
                continue
            }
            let key = strAry[0]
            let width = strAry[1]
            let config: RXLognalysisConfigModel = RXLognalysisConfigModel(key: key, width: width)
            // 添加到字典中
            self.configMapping[key] = config
        }
    }
    func loadEvent() {
        self.load(path: "rx_log_event", mapping: &self.eventMapping)
    }
    func loadEnterLeaveRoom() {
        self.load(path: "rx_log_enterLeaveRoom", mapping: &self.enterLeaveRoomMapping)
    }
    
    func load(path: String,  mapping: inout [String: String]) {
        let myStrings = self.load(path: path)
        for str in myStrings {
            if str.hasPrefix("//") {
                continue
            }
            let strAry = str.components(separatedBy: ",")
            if strAry.count < 2 {
                continue
            }
            let key = strAry[0]
            let value = strAry[1]
            // 添加到字典中
            mapping[key] = value
        }
    }
    
    func load(path: String) -> [String] {
        // https://www.jianshu.com/p/049147550443
        let path = Bundle.main.path(forResource: path, ofType: "txt")
        let url = URL(fileURLWithPath: path!)
        let tmpContent: String? = try? String(contentsOf: url)
        if tmpContent == nil {
            return []
        }
        let separatedString: String = "\n"
        let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
        let myStrings: [String] = content.components(separatedBy: separatedString)
        return myStrings
    }
    
    
    func configModel(key: String) -> RXLognalysisConfigModel {
        let configModel: RXLognalysisConfigModel? = RXLogAnalysisManager.sharedInstance.configMapping[key] as? RXLognalysisConfigModel
        if configModel != nil {
            return configModel!
        } else {
            return RXLognalysisConfigModel.init(key: key)
        }
    }
}
