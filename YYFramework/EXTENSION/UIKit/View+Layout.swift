//
//  View+Layout.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/9/29.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit

extension UIView {
    
    func yy_addLayout(top: CGFloat, left: CGFloat, right: CGFloat, height: CGFloat,item: UIView, toItem: UIView) {
        self.addConstraint(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: toItem, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: toItem, attribute: .left, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: toItem, attribute: .right, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: height))
    }
    
}
