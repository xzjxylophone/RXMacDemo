//
//  RXLogAnalysisListTableViewImpl.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa
import Regex


class RXLogAnalysisListTableViewImpl: NSObject, NSTableViewDelegate, NSTableViewDataSource {
    var dataArray: [RXLogAnalysisListModel] = []
    
    func load(path: String) {
        
        self.dataArray = []
        let fm = FileManager.default
        let isDir: UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
        let isExist = fm.fileExists(atPath: path, isDirectory: isDir)
        if isExist && isDir.pointee.boolValue {
            // https://www.jianshu.com/p/50b3d40f1150
            do {
                let files: [String]? = try? fm.contentsOfDirectory(atPath: path)
                if nil != files {
                    for fileName in files! {
                        let fullPath = path + "/" + fileName
                        let isDir2: UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
                        let isExist2 = fm.fileExists(atPath: fullPath, isDirectory: isDir2)
                        if isExist2 && !isDir2.pointee.boolValue {
                            let tmpContent: String? = try? String(contentsOf: URL(fileURLWithPath: fullPath))
                            if tmpContent == nil {
                                continue
                            }
                            let separatedString: String = "\n"
                            let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
                            let myStrings = content.components(separatedBy: separatedString)
                            // https://blog.csdn.net/u013776081/article/details/43152759
                            // https://www.cnblogs.com/zwvista/p/8324371.html
                            var keys: [String] = []
                            var items: [RXLogAnalysisDetailModel] = []
//                            let pattern: String = ", (?=(?:\"[^\"]*?(?: [^\"]*)*))|, (?=[^\",]+(?:,|$))"
//                            let pattern: String = ",(?=([^\"]*\"[^\"]*\")*[^\"]*$)"
//                            let pattern: String = ",(?=([^\"]*\"[^\"]*\")*[^\"]*$)"
//                            let pattern: String = "(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)"
//                            let pattern: String = "[^,\"']+|\"([^\"]*)\""
                            // https://stackoverflow.com/questions/628583/regular-expression-to-split-on-commas-not-enclosed-in-parenthesis
                            // https://stackoverflow.com/questions/13267840/string-split-on-comma-exclude-comma-in-double-quote-and-split-adjacent-commas
                            let pattern: String = ",(?=(?:(?:[^\"]*\"){2})*[^\"]*$)"
                            
//                            let pattern: String = ",(?![^\"]*+\\\")"
//                            let pattern: String = ",(?![^()]*+\\))"
                            for line in myStrings {
                                if line.count == 0 {
                                    continue
                                }
                                if keys.count == 0 {
                                    keys = line.components(separatedBy: ",")
                                } else {
                                    let values: [String] = line.split(using: pattern.r)
                                    let item:RXLogAnalysisDetailModel = RXLogAnalysisDetailModel.init(_values: values)
                                    items.append(item)
                                }
                            }
                            let listModel:RXLogAnalysisListModel = RXLogAnalysisListModel()
                            listModel.keys = keys
                            listModel.items = items
                            listModel.fileFullPath = fullPath
                            self.dataArray.append(listModel)
                        }
                    }
                }
                
//                // 第二种循环
//                if let files = files {
//                    for fileName in files {
//                        NSLog("\(fileName)")
//                    }
//                }
            }
            
            
        } else {
            NSLog("2222")
        }
        
        NSLog("load end")
        
    }
    
}
