//
//  GAPageControlViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/12/10.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit

class GAPageControlViewController: UIViewController {
    
    @IBOutlet weak var pageC: GAPageControl!
    @IBOutlet weak var pageControl: GAColletionViewPageControl!
    @IBOutlet weak var stackView: UIStackView!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        count += 1
        if count == 5{
            count = 0
        }
        update()
    }
    
    func update() {
        UIView.animate(withDuration: 0.3) {
            for i in 0..<self.stackView.arrangedSubviews.count {
                let v = self.stackView.arrangedSubviews[i] as! UIImageView
                if i == self.count {
                    v.image = UIImage(named: "tabbar_mine_default")
                } else {
                    v.image = UIImage(named: "page_control_point")
                }
            }
        }
    }
    
    @IBAction func action(_ sender: UIButton) {
        pageControl.currentPage = sender.tag
        pageC.currentPage = sender.tag
    }
    
    
}


