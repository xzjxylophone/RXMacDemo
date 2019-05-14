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
    
    
    let tableViewData = [["firstName1111":"John","lastName":"Doe","emailId":"john.doe@knowstack.com"],["firstName1111":"Jane","lastName":"Doe","emailId":"jane.doe@knowstack.com"]]
    
    
    weak var tableView: NSTableView? = nil {
        willSet {
//            self.tableView?.dataSource = nil
//            self.tableView?.delegate = nil
        }
        didSet {
            self.tableView?.dataSource = self
            self.tableView?.delegate = self
            self.setupTableView()
        }
    }
    
    func setupTableView() {
        let tableColumn = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("emailId"))
        self.tableView?.addTableColumn(tableColumn)
    }
    
    func load(path: String) {
        
        self.dataArray = []
        let fm = FileManager.default
        let isDir: UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
        let isExist = fm.fileExists(atPath: path, isDirectory: isDir)
        if !isExist || !isDir.pointee.boolValue {
            // TODO
            return
        }
        // https://www.jianshu.com/p/50b3d40f1150
        do {
            let files: [String]? = try? fm.contentsOfDirectory(atPath: path)
            
            if files == nil {
                // TODO
                return
            }
            self.load(path:path, files: files!)
        }
    }
    
    func load(path: String, files: [String]) {
        let fm = FileManager.default
        for fileName in files {
            let fullPath = path + "/" + fileName
            let isDir2: UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
            let isExist2 = fm.fileExists(atPath: fullPath, isDirectory: isDir2)
            if isExist2 && !isDir2.pointee.boolValue {
                let tmpContent: String? = try? String(contentsOf: URL(fileURLWithPath: fullPath))
                if tmpContent == nil {
                    continue
                }
                let listModel:RXLogAnalysisListModel = RXLogAnalysisListModel()
                listModel.fileFullPath = fullPath
                let separatedString: String = "\n"
                let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
                let myStrings = content.components(separatedBy: separatedString)
                // https://blog.csdn.net/u013776081/article/details/43152759
                // https://www.cnblogs.com/zwvista/p/8324371.html
//                var items: [RXLogAnalysisDetailModel] = []
                // https://stackoverflow.com/questions/628583/regular-expression-to-split-on-commas-not-enclosed-in-parenthesis
                // https://stackoverflow.com/questions/13267840/string-split-on-comma-exclude-comma-in-double-quote-and-split-adjacent-commas
                let pattern: String = ",(?=(?:(?:[^\"]*\"){2})*[^\"]*$)"
                for line in myStrings {
                    if line.count == 0 {
                        continue
                    }
                    if listModel.keys.count == 0 { // 第一行获取keys
                        listModel.keys = line.components(separatedBy: ",")
                    } else {
                        let values: [String] = line.split(using: pattern.r)
//                        let item:RXLogAnalysisDetailModel = RXLogAnalysisDetailModel.init(_values: values)
//                        items.append(item)
                        if listModel.setBaseInfo(values: values) {
                            // 如果已经设置了相关的基本信息，可以暂停逐行分析
                            break;
                        }
                    }
                }
                self.dataArray.append(listModel)
            }
        }
    }
    
    
    // MARK: NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let key: String = (tableColumn?.identifier.rawValue)!
        return tableViewData[row][key]
    }
    
    
    
}
