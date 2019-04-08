//
//  ViewController.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/4/2.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    // mark - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    //
    @IBAction func logAnalysisAction(sender: NSButton) {
        let wc = RXLogAnalysisMainWindowController(windowNibName: "RXLogAnalysisMainWindowController")
        wc.showWindow(nil)
        
        // 以下的两种方式无法加载xib的内容
//        let wc = RXLogAnalysisMainWindowController(windowNibName: "RXLogAnalysisMainWindowController", owner:self)
//        wc.showWindow(nil)
//        let wc = RXLogAnalysisMainWindowController(windowNibName: "RXLogAnalysisMainWindowController", owner:Bundle.main)
//        wc.showWindow(nil)
    }


}

