//
//  MD（埋点）.swift
//  YYFramework
//
//  Created by houjianan on 2019/8/6.
//  Copyright © 2019 houjianan. All rights reserved.
//  统计类

import Foundation

class MD {

    // 统计基本事件
    static func md_event(id: String, label: String = "") {
        if !label.isEmpty {
            BaiduMobStat.default()?.logEvent(id, eventLabel: label)
        }
        
        MobClick.event(id, label: label)
    }
    
    // 页面开始
    static func md_pageSart(name: String) {
        BaiduMobStat.default()?.pageviewStart(withName: name)
        
        MobClick.beginLogPageView(name)
    }
    
    // 页面离开
    static func md_pageEnd(name: String) {
        BaiduMobStat.default()?.pageviewEnd(withName: name)
        
        MobClick.endLogPageView(name)
    }
    
    // 登录
    static func md_signIn(id: String) {
        MobClick.profileSignIn(withPUID: id)
    }

    // web统计
    // 代理方法： -(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
    static func md_webView(name: String, body: [AnyHashable : Any]) {
        BaiduMobStat.default()?.didReceiveScriptMessage(name, body: body)
    }

}

