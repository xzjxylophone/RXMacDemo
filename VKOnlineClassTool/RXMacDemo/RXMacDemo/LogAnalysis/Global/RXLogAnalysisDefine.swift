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

enum RXLogType: String {
    case configDescription = "rx_log_config_description"
    case event = "rx_log_event"
    case enterLeaveRoom = "rx_log_enterLeaveRoom"
    case reloadOrTerminate = "rx_log_reloadOrTerminate"
    case audio_video = "rx_log_audio_video"
    case vk_ppt = "rx_log_vk_ppt"
    case db_ppt = "rx_log_db_ppt"
    case audio = "rx_log_audio"
    case gesture = "rx_log_gesture"
}


