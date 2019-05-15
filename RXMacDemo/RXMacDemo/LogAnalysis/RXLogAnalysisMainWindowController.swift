//
//  RXLogAnalysisMainWindowController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/2.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

import SnapKit


//@objcMembers
//// https://stackoverflow.com/questions/44461603/valueforkey-for-nsobject-not-working-in-swift-4
//// http://www.knowstack.com/swift-3-1-nstableview-complete-guide/
//// https://stackoverflow.com/questions/33992756/is-it-possible-to-create-a-view-based-nstableview-purely-in-code
//class TTModel : NSObject {
//    public var name: String = ""
//    public var age: Int = 0
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}

class RXLogAnalysisMainWindowController: NSWindowController {
    
//    @IBOutlet weak var listScrollView: NSScrollView?
//    @IBOutlet weak var listTableView: NSTableView?
//    @IBOutlet weak var detailTableView: NSTableView?
//    @IBOutlet weak var detailScrollView: NSScrollView?
//
//    var modelArray: [TTModel] = []
//
//    let tableViewData = [["firstName":"John","lastName":"Doe","emailId":"john.doe@knowstack.com"],["firstName":"Jane","lastName":"Doe","emailId":"jane.doe@knowstack.com"]]
//
//    let context: RXLogAnalysisContext! = RXLogAnalysisContext()
    
    init() {
        let vc = RXLogAnalysisMainViewController.init()
        let window = NSWindow.init(contentViewController: vc)
        super.init(window: window)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//        let m1: TTModel = TTModel.init(name: "abc", age: 1)
//        let m2: TTModel = TTModel.init(name: "def", age: 2)
//        self.modelArray.append(m1)
//        self.modelArray.append(m2)
//        self.window?.contentView?.addSubview(self.listScrollView)
//        self.window?.contentView?.addSubview(self.detailScrollView)
//        // 使用如下的方式给ScrollView绑定一个tableView
//        self.listScrollView.contentView.documentView = self.listTableView
//        self.detailScrollView.contentView.documentView = self.detailTableView
////        self.listScrollView.addSubview(self.listTableView)
////        self.detailScrollView.addSubview(self.detailTableView)
//
//
//        self.listScrollView.snp.makeConstraints { (maker) in
//            maker.width.equalTo(100)
//            maker.top.equalToSuperview().offset(0)
//            maker.left.equalToSuperview().offset(0)
//            maker.bottom.equalToSuperview().offset(0)
//        }
//
//        self.detailScrollView.snp.makeConstraints { (maker) in
//            maker.top.equalToSuperview().offset(0)
//            maker.left.equalToSuperview().offset(100)
//            maker.right.equalToSuperview().offset(0)
//            maker.bottom.equalToSuperview().offset(0)
//        }
        
        
        
        
//        self.listTableView.frame = NSRect.init(x: 0, y: 0, width: 30, height: 30)
//        self.listTableView.snp.makeConstraints { (maker) in
//            maker.edges.equalTo(0)
//        }
        
//        self.listTableView.backgroundColor = NSColor.blue
//        self.listScrollView.backgroundColor = NSColor.red
        
//        self.detailScrollView.backgroundColor = NSColor.green
        
//        RXLogAnalysisManager.sharedInstance.context = self.context
//
//        self.context.listImpl.tableView = self.listTableView
//        self.context.detailImpl.tableView = self.detailTableView
//
//        self.listTableView?.delegate = self
//        self.listTableView?.dataSource = self
        
        
        
        
//        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "cell"))
//        column.width = 100
//        column.maxWidth = 100;
//        column.minWidth = 100;
//        column.title = "column1"
//        self.listTableView?.addTableColumn(column)
//        
        
//        self.context.load()
//
//
//
//        self.listTableView?.reloadData()
//        self.detailTableView?.reloadData()
    
        
        
    }
    
    
    // MARK: - NSTableViewDataSource
//    func numberOfRows(in tableView: NSTableView) -> Int {
////        return self.modelArray.count
//        return tableViewData.count
//    }
//    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
//        let textFieldCell: NSTextFieldCell? = cell as? NSTextFieldCell
//        textFieldCell?.title = "3333"
//    }
//    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
//        return 40
//    }
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
////        let model: TTModel = self.modelArray[row]
////        let key: String = tableColumn?.identifier.rawValue ?? ""
////        let value = model.value(forKeyPath: key)
////        return value
//
//        return tableViewData[row][(tableColumn?.identifier.rawValue)!]
//    }
    
//    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
//        let model: TTModel = self.modelArray[row]
//        let key: String = tableColumn?.identifier.rawValue ?? ""
//        model.setValue(object, forKey: key)
//    }
    
//
//    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
//
//    }
    // MARK: - NSTableViewDelegate
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        let identifier: NSUserInterfaceItemIdentifier = (tableColumn?.identifier)!
//        print("%@", identifier)
//        if let cell = tableView.makeView(withIdentifier: identifier, owner: self) as? NSTableCellView {
////            print("before %@", cell.textField?.stringValue)
//            cell.textField?.stringValue = "abddd"
////            print("after %@", cell.textField?.stringValue)
////            cell.textField?.textColor = NSColor.red
//            return cell
//        }
//        return nil
//    }
    
 
    
//    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
//        let tableViewCell: NSTextFieldCell = cell as! NSTextFieldCell
//        tableViewCell.textColor = NSColor.red
//        tableViewCell.stringValue = "1111"
//    }
    
    //
//    func tableView(_ tableView: NSTableView, dataCellFor tableColumn: NSTableColumn?, row: Int) -> NSCell? {
//        return nil
//    }
}

