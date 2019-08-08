//
//  AppDelegate.swift
//  YYFramework
//
//  Created by houjianan on 2018/8/11.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit
import SwiftTheme

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(NSHomeDirectory())
        
        _initViews()
        
        theme_setupNormalTheme()
//        growingIO_start()
        ga_configUMengAnalytics()
//        ga_configBaiduMobStat
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return true
//        return growingIO_open(url: url)
    }
}

extension AppDelegate {
    private func _initViews() {
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            
        }
    }
}
