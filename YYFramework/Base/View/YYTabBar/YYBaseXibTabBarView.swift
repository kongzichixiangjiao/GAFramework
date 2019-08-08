//
//  YYBaseXibTabBarView.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/9/29.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit

@objc protocol YYBaseXibTabBarViewDelegate: NSObjectProtocol {
    func base_xibTabBarView(currentIndex c_index: Int, clickedIndex d_index: Int)
    @objc optional func base_xibTabBarViewClickedCurrentItem(index: Int)
}

class YYBaseXibTabBarView: UIView {
    
    weak var mDelegate: YYBaseXibTabBarViewDelegate?
    
    var currentIndex: Int = 0
    
    @IBOutlet var buttons: [YYXibTabBarItem]!
    
    static func loadBaseXibTabBarView() -> YYBaseXibTabBarView {
        return Bundle.main.loadNibNamed("YYBaseXibTabBarView", owner: self, options: nil)?.last as! YYBaseXibTabBarView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0..<buttons.count {
            let b = buttons[i]
            b.mDelegate = self
        }
    }

}

extension YYBaseXibTabBarView: YYXibTabBarItemDelegate {
    func YYXibTabBarItemTap(title: String, tag: Int) -> Bool {
        if currentIndex == tag {
            mDelegate?.base_xibTabBarViewClickedCurrentItem?(index: currentIndex)
            return false 
        }
        for i in 0..<buttons.count {
            buttons[i].isHighlight = false
        }
        
        mDelegate?.base_xibTabBarView(currentIndex: currentIndex, clickedIndex: tag)
        
        currentIndex = tag
        return true 
    }
}
