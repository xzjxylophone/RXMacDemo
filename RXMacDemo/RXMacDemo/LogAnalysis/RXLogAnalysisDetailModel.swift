//
//  RXLogAnalysisDetailModel.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisDetailModel: NSObject {
    
    var values: [String] = []
    init(_values: [String]) {
        self.values = _values
    }
    
    
    var showKeyValueCache: [String: Any] = [:]
    
    
    
    
    func getValue(listModel: RXLogAnalysisListModel, key: String) -> String {
        let index: Int = listModel.keys.index(of: key) ?? -1
        if index == -1 {
            return ""
        }
        var result: String = self.values[index]
        let configModel = RXLogAnalysisManager.sharedInstance.configModel(key: key)
        if configModel.showKey.count == 0 {
        } else {
            
            let showKey: String = configModel.showKey
            let value: String? = self.showKeyValueCache[showKey] as? String
            if value != nil {
                result = value!
            } else {
                let tmp: String = configModel.action?(result) ?? ""
                result = tmp
            }
        }
        return result
    }
}
