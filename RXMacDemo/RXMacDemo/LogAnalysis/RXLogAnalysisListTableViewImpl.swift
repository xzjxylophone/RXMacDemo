//
//  RXLogAnalysisListTableViewImpl.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisListTableViewImpl: NSObject, NSTableViewDelegate, NSTableViewDataSource {
    var dataArray:[RXLogAnalysisListModel] = []
    
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
                            let content: String? = try? String(contentsOf: URL(fileURLWithPath: fullPath))
                            let myStrings = content!.components(separatedBy: .newlines)
                            // https://blog.csdn.net/u013776081/article/details/43152759
                            // https://www.cnblogs.com/zwvista/p/8324371.html
                            for line in myStrings {
                                NSLog("%@", line)
                                
                                
                            }
                        }
                        // 测试的时候先读一个
                        break
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
        
    }
    
}
