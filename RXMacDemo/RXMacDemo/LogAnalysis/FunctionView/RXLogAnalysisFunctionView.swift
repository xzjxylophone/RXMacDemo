//
//  RXLogAnalysisFunctionView.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class RXLogAnalysisFunctionView: NSView, NSTableViewDelegate, NSTableViewDataSource {
    
    let scrollView: NSScrollView = NSScrollView()
    let tableView: NSTableView = NSTableView()

    var listModel: RXLogAnalysisListModel = RXLogAnalysisListModel()
    
    var itemArray: [RXFunctionItem] = []
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        let titles: [String] = ["行列显示", "诊断分析", "进入教室/退出教室筛选", "教室内崩溃检测"]
        let actions: [String] = ["columnRowAction", "diagnoseAction", "enterLeaveRoomAction", "crashCheckAction"]
        var itemArray: [RXFunctionItem] = []
        for (index, title) in titles.enumerated() {
            let action = actions[index]
            let item = RXFunctionItem(title: title, action: action)
            itemArray.append(item)
        }
        self.itemArray = itemArray
        
        self.scrollView.contentView.documentView = self.tableView
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.usesAlternatingRowBackgroundColors = true
        self.tableView.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init("item")))
        
        self.addSubview(self.scrollView)
        
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(0)
            make.left.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(0)
            make.right.equalTo(self).offset(0)
        }
        
    }
    
    func reload(listModel: RXLogAnalysisListModel) {
        self.listModel = listModel
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    // MARK: NSTableViewDelegate
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        let item: RXFunctionItem = self.itemArray[row]
        let action: String = item.action
        let sel: Selector = NSSelectorFromString(action)
        self.perform(sel)
        return true
    }
    // MARK: - NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.itemArray.count
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let item: RXFunctionItem = self.itemArray[row]
        return item.title
    }
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        if cell is NSTextFieldCell {
            let textFieldCell:NSTextFieldCell = cell as! NSTextFieldCell
            textFieldCell.font = NSFont.systemFont(ofSize: 17)
            textFieldCell.alignment = .center
        }
    }
    // MARK: Action
    // 必须加@objc
    @objc func columnRowAction() {
        print("columnRowAction")
        let vc = RXLAColumnRowViewController.init()
        let window = NSWindow.init(contentViewController: vc)
        let wc = NSWindowController.init(window: window)
        vc.reload(listModel: self.listModel)
        wc.showWindow(nil)
    }
    @objc func diagnoseAction() {
        print("diagnoseAction")
    }
    @objc func enterLeaveRoomAction() {
        print("enterLeaveRoomAction")
    }
    @objc func crashCheckAction() {
        print("crashCheckAction")
    }
    
}
