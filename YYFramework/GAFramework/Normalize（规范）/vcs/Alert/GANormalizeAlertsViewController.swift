//
//  GANormalizeAlertsViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2019/2/13.
//  Copyright © 2019年 houjianan. All rights reserved.
//

import UIKit
import GAAlertPresentation

class GANormalizeAlertsViewController: GANormalizeBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func defaultAlert(_ sender: Any) {
//        let d = YYPresentationDelegate(animationType: <#T##PresentationAnimationType#>, isShowMaskView: <#T##Bool#>, maskViewColor: <#T##UIColor#>)
        
        let d = YYPresentationDelegate(animationType: .sheet, isShowMaskView: true, maskViewColor: kMaskLayerColor)
        let bundle = Bundle.ga_podBundle(aClass: AnimationBaseViewController.classForCoder(), resource: "GAAlertPresentation")
        let vc = AnimationBaseViewController(nibName: "AnimationBaseViewController", bundle: bundle, delegate: d)
        vc.clickedHandler = {
            tag, model in
            print(tag)
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func alertOnlyBottom(_ sender: Any) {
        let d = YYPresentationDelegate(animationType: .alert, isShowMaskView: true, maskViewColor: kMaskLayerColor)
        let bundle = Bundle.ga_podBundle(aClass: PXAlertOnlyBottomViewController.classForCoder(), resource: "GAAlertPresentation")
        let vc = PXAlertOnlyBottomViewController(nibName: "PXAlertOnlyBottomViewController", bundle: bundle, delegate: d)
        vc.clickedHandler = {
            tag, model in
            print(tag)
        }
        vc.text = "这个text属性要更改为open/public"
        self.present(vc, animated: true, completion: nil)
    }
    
}
