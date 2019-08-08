//
//  YYTabBarController.swift
//  YueYe
//
//  Created by 侯佳男 on 2017/5/19.
//  Copyright © 2017年 侯佳男. All rights reserved.
//  self.title = "" 这个不要设置  YYBaseXibTabBarView配置导航样式  storyboard增删vc

import UIKit
import TransitionableTab

class YYTabBarViewController: UITabBarController {
    
    public var vcs: [UIViewController] = []
    
    private var didSelected: Int = 0
    
    lazy var xibTabBarView: YYBaseXibTabBarView = {
        let v = YYBaseXibTabBarView.loadBaseXibTabBarView()
        v.mDelegate = self
        v.frame = CGRect(x: 0, y: 0, width: self.tabBar.bounds.width, height: kTabBarHeight)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin]
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewControllers()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func initViewControllers() {
        guard let arr = self.viewControllers else {
            print("viewControllers 为空")
            return
        }
        
        for vc in arr {
            if NSStringFromClass(type(of: vc)).components(separatedBy: ".").last! == "YYNavigationViewController" ||
                NSStringFromClass(type(of: vc)).components(separatedBy: ".").last! == "UINavigationViewController" {
                self.addChild(vc)
                self.vcs.append(vc)
            } else {
                let nav = YYNavigationViewController(rootViewController: vc)
                self.addChild(nav)
                self.vcs.append(nav)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _addTabBarView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _addTabBarView()
    }
    
    private func _addTabBarView() {
        
        for v in tabBar.subviews {
            v.removeFromSuperview()
        }
        
        self.tabBar.insertSubview(xibTabBarView, at: 10010)
    }
    
    private func login() {
        //        if xibTabBarView.currentIndex == 1 {
        //            let login = YYLoginViewController(nibName: "YYLoginViewController", bundle: nil)
        //            self.present(login, animated: true, completion: nil)
        //            xibTabBarView.currentIndex = didSelected
        //        } else {
        //            let index = xibTabBarView.currentIndex
        //            self.xibTabBarView.updateButton(index: index)
        //            didSelected = xibTabBarView.currentIndex
        //        }
    }
    
    public var tabBar_currentVC: UIViewController {
        return self.viewControllers![selectedIndex]
    }
    
    public func willShowVC(clickedIndex d_idnex: Int) -> UIViewController {
        return self.viewControllers![d_idnex]
    }
    
}

extension YYTabBarViewController: YYBaseXibTabBarViewDelegate {
    func base_xibTabBarView(currentIndex c_index: Int, clickedIndex d_index: Int) {
        
//        let dVC = willShowVC(clickedIndex: d_index)
//
//        tabBar_currentVC.view.hero.modifiers = [.opacity(0.5), .zPosition(2.0)]
//        dVC.view.hero.modifiers = [.opacity(0.3)]
        
        self.selectedIndex = d_index
        
        login()
    }
    
    func base_xibTabBarViewClickedCurrentItem(index: Int) {

    }
}
