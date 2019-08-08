//
//  AppDelegate+StatusBarOrientation.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/9/30.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func application(_ application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation) {
        
    }
    
    func application(_ application: UIApplication, willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        print(newStatusBarOrientation.isLandscape)
        print(newStatusBarOrientation.isPortrait)
    }
    
}
