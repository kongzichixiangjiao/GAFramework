//
//  YYInterlockRootViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/9/21.
//  Copyright © 2018年 houjianan. All rights reserved.
//  连动

import UIKit

class YYInterlockRootViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
//        self.navigationController?.pushViewController(YYInterlockItemViewController(), animated: true)
        self.navigationController?.pushViewController(YYInterlockViewController(), animated: true)
    }

}
