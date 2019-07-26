//
//  RXLogAnalysisFunctionView.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa
protocol RXLogAnalysisFunctionViewDelegate: NSObjectProtocol {
    func enterLeaveRoomAction()
    func audioVideoAction()
    func vkPPTAction()
    func dbPPTAction()
    func allAction()
    func inClassAction()
    func gossipAction()
    func outClassAction()
    func jkClassAction()
    func audioAction()
    func gestureAction()
    func reloadOrTerminateAction()
}


class RXLogAnalysisFunctionView: NSView, NSTableViewDelegate, NSTableViewDataSource {
    
    let scrollView: NSScrollView = NSScrollView()
    let tableView: NSTableView = NSTableView()

    var listModel: RXLogAnalysisListModel = RXLogAnalysisListModel()
    
    var itemArray: [RXFunctionItem] = []
    
    weak var delegate: RXLogAnalysisFunctionViewDelegate? = nil
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        let titles: [String] = ["行列显示", "诊断分析",  "全部日志",
                                "教室内日志", "gossip日志", "教室外日志", "监课日志",
                                "进入教室/退出教室日志", "音视频测速日志",
                                "VK_PPT日志", "多贝PPT日志", "音频相关", "手势识别",
                                "重启/手动结束app日志", "教室内崩溃检测"]
        let actions: [String] = ["columnRowAction", "diagnoseAction", "allAction",
                                 "inClassAction", "gossipAction", "outClassAction", "jkClassAction",
                                 "enterLeaveRoomAction", "audioVideoAction",
                                 "vkPPTAction", "dbPPTAction", "audioAction", "gesturAction",
                                 "reloadOrTerminateAction", "crashCheckAction"]
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
    @objc func allAction() {
        self.delegate?.allAction()
    }
    @objc func inClassAction() {
        self.delegate?.inClassAction()
    }
    @objc func gossipAction() {
        self.delegate?.gossipAction()
    }
    @objc func outClassAction() {
        self.delegate?.outClassAction()
    }
    @objc func jkClassAction() {
        self.delegate?.jkClassAction()
    }
    @objc func enterLeaveRoomAction() {
//        print("enterLeaveRoomAction")
        self.delegate?.enterLeaveRoomAction()
    }
    @objc func audioVideoAction() {
        self.delegate?.audioVideoAction()
    }
    @objc func vkPPTAction() {
        self.delegate?.vkPPTAction()
    }
    @objc func dbPPTAction() {
        self.delegate?.dbPPTAction()
    }
    @objc func audioAction() {
        self.delegate?.audioAction()
    }
    @objc func gesturAction() {
        self.delegate?.gestureAction()
    }
    @objc func reloadOrTerminateAction() {
        self.delegate?.reloadOrTerminateAction()
    }
    @objc func crashCheckAction() {
        print("crashCheckAction")
    }
    
}
