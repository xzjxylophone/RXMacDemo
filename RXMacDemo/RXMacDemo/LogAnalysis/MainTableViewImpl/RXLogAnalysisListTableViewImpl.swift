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
            self.setupTableView()
        }
    }
    
    func setupTableView() {
        // 颜色交替
        self.tableView?.usesAlternatingRowBackgroundColors = true
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.allowsColumnResizing = true
        
        let tableColumn = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("description"))
        tableColumn.title = "简要说明"
        tableColumn.isEditable = false
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
        for fileName in files {
            let fullPath = path + "/" + fileName
            
            
            let listModel:RXLogAnalysisListModel = RXLogAnalysisListModel()
            listModel.fileFullPath = fullPath
            listModel.fileName = fileName
            let returnValue = self.load(fileFullPath: fullPath, model: listModel, detailModelArray: nil)
            if returnValue {
                self.dataArray.append(listModel)
            }
        }
    }
    
    func load(fileFullPath: String, model: RXLogAnalysisListModel, detailModelArray: [RXLogAnalysisDetailModel]?) ->Bool {
        let fm = FileManager.default
        let isDir2: UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
        let isExist2 = fm.fileExists(atPath: fileFullPath, isDirectory: isDir2)
        if !isExist2 || isDir2.pointee.boolValue {
            return false
        }
        let tmpContent: String? = try? String(contentsOf: URL(fileURLWithPath: fileFullPath))
        if tmpContent == nil {
            return false
        }
        let separatedString: String = "\n"
        let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
        let myStrings = content.components(separatedBy: separatedString)
        // https://blog.csdn.net/u013776081/article/details/43152759
        // https://www.cnblogs.com/zwvista/p/8324371.html
        var items: [RXLogAnalysisDetailModel] = []
        // https://stackoverflow.com/questions/628583/regular-expression-to-split-on-commas-not-enclosed-in-parenthesis
        // https://stackoverflow.com/questions/13267840/string-split-on-comma-exclude-comma-in-double-quote-and-split-adjacent-commas
        let pattern: String = ",(?=(?:(?:[^\"]*\"){2})*[^\"]*$)"
        var realIndex: Int = 0
        for line in myStrings {
            if line.count == 0 {
                continue
            }
            if model.keys.count == 0 { // 第一行获取keys
                model.keys = line.components(separatedBy: ",")
            } else {
                let values: [String] = line.split(using: pattern.r)
                if !model.isBaseInfoLoad {
                    let setResult = model.setBaseInfo(values: values)
                    print("\(setResult)")
                }
                let item: RXLogAnalysisDetailModel = RXLogAnalysisDetailModel.init(_values: values)
                item.realIndex = realIndex
                realIndex += 1
                items.append(item)
            
            }
        }
        model.items = items
        return true
    }
    
    func load(fileFullPath: String) ->[RXLogAnalysisDetailModel] {
        var resultArray: [RXLogAnalysisDetailModel] = []
        let tmpContent: String? = try? String(contentsOf: URL(fileURLWithPath: fileFullPath))
        let separatedString: String = "\n"
        let content: String = tmpContent!.replacingOccurrences(of: "\r\n", with: separatedString).replacingOccurrences(of: "\r", with: separatedString)
        let myStrings = content.components(separatedBy: separatedString)
        // https://blog.csdn.net/u013776081/article/details/43152759
        // https://www.cnblogs.com/zwvista/p/8324371.html
        //                var items: [RXLogAnalysisDetailModel] = []
        // https://stackoverflow.com/questions/628583/regular-expression-to-split-on-commas-not-enclosed-in-parenthesis
        // https://stackoverflow.com/questions/13267840/string-split-on-comma-exclude-comma-in-double-quote-and-split-adjacent-commas
        let pattern: String = ",(?=(?:(?:[^\"]*\"){2})*[^\"]*$)"
        var isFirst = true
        var realIndex: Int = 0;
        for line in myStrings {
            if line.count == 0 {
                continue
            }
            if isFirst { // 第一行获取keys
                isFirst = false
            } else {
                let values: [String] = line.split(using: pattern.r)
                let item:RXLogAnalysisDetailModel = RXLogAnalysisDetailModel.init(_values: values)
                item.realIndex = realIndex
                // swift 没有++？
                realIndex = realIndex + 1
                resultArray.append(item)
            }
        }
        return resultArray
    }
    
    func showDetail(index: Int) {
        if (index < 0 || index >= self.dataArray.count) {
            return
        }
        let model: RXLogAnalysisListModel = self.dataArray[index]
        
        let context: RXLogAnalysisContext? = RXLogAnalysisManager.sharedInstance.context
        context?.detailImpl.reload(listModel: model)
        context?.functionView?.reload(listModel: model)
        context?.functionView?.delegate = context?.detailImpl
    }
    
    // MARK: NSTableViewDelegate
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        self.showDetail(index: row)
        return true
    }
    
    // MARK: NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let key: String = (tableColumn?.identifier.rawValue)!
        let model: RXLogAnalysisListModel = self.dataArray[row]
        return model.value(forKey: key)
    }
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        if cell is NSTextFieldCell {
            let textFieldCell:NSTextFieldCell = cell as! NSTextFieldCell
            textFieldCell.font = NSFont.systemFont(ofSize: 17)
        }
    }
    
}
