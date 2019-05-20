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
    
    override init() {
        super.init()
        self.loadConfig()
        self.loadEvent()
    }
    func loadConfig() {
        // https://www.jianshu.com/p/049147550443
        let path = Bundle.main.path(forResource: "rx_log_config", ofType: "txt")
        let url = URL(fileURLWithPath: path!)
        let tmpContent: String? = try? String(contentsOf: url)
        if tmpContent == nil {
            return
        }
        let separatedString: String = "\n"
        let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
        let myStrings = content.components(separatedBy: separatedString)
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
        // https://www.jianshu.com/p/049147550443
        let path = Bundle.main.path(forResource: "rx_log_event", ofType: "txt")
        let url = URL(fileURLWithPath: path!)
        let tmpContent: String? = try? String(contentsOf: url)
        if tmpContent == nil {
            return
        }
        let separatedString: String = "\n"
        let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
        let myStrings = content.components(separatedBy: separatedString)
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
            self.eventMapping[key] = value
        }
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
