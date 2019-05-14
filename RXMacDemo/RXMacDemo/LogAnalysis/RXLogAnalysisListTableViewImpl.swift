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
    
    weak var tableView: NSTableView? = nil {
        willSet {
//            self.tableView?.dataSource = nil
//            self.tableView?.delegate = nil
        }
        didSet {
//            self.tableView?.dataSource = self
//            self.tableView?.delegate = self
//            self.setupTableView()
        }
    }
    
    func setupTableView() {
        
        
        
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "cell"))
        column.width = 100
        column.maxWidth = 100;
        column.minWidth = 100;
        column.title = "column1"
        self.tableView?.addTableColumn(column)
    }
    
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
                            // https://stackoverflow.com/questions/628583/regular-expression-to-split-on-commas-not-enclosed-in-parenthesis
                            // https://stackoverflow.com/questions/13267840/string-split-on-comma-exclude-comma-in-double-quote-and-split-adjacent-commas
                            let pattern: String = ",(?=(?:(?:[^\"]*\"){2})*[^\"]*$)"
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
    
    // MARK: - NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
//        return self.dataArray.count
        return 10
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 40
    }
    
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
////        let model: RXLogAnalysisListModel = self.dataArray[row]
//        return String.init(format: "%ld", row)
//    }
    
    
    // MARK: - NSTableViewDelegate
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier: String = "cell"
//        let model: RXLogAnalysisListModel = self.dataArray[row]
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: identifier), owner: nil) as? NSTableCellView {
//            cell.textField?.stringValue = model.fileFullPath
            cell.textField?.stringValue = "1111"
            return cell
        }
        return nil
    }
//
    func tableView(_ tableView: NSTableView, dataCellFor tableColumn: NSTableColumn?, row: Int) -> NSCell? {
        return nil
    }
    
    
    
}
