//
//  AppDelegate-UM.swift
//  YYFramework
//
//  Created by houjianan on 2019/8/2.
//  Copyright © 2019 houjianan. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    func ga_configUMengAnalytics() {
        DispatchQueue.global().async {
            UMCommonLogManager.setUp()
            // um账号 kongzichixiangjiao
            UMConfigure.initWithAppkey("5d43cc4a0cafb2603500084d", channel: "App Store")
            UMConfigure.setLogEnabled(true)
            
            MobClick.setAutoPageEnabled(true)
        }
        self.statistics()
    }
    
    func statistics() {
        let _ = UIViewController.ga_share
    }

}
