//
//  RXLogAnalysisDefine.swift
//  RXMacDemo
//
//  Created by Rush.D.Xzj on 2019/5/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

import Foundation

func StringFromVendor(vendor: Int) -> String {
    switch vendor {
    case 0:
        return "多贝"
    case 1:
        return "VLS"
    case 2:
        return "腾讯"
    case 3:
        return "声网"
    default:
        return "未知"
    }
}
