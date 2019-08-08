//
//  YYLoginViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/9/27.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit
import GAAlertPresentation

enum YYLoginVCBackEnum {
    case pop, dismiss, root(vc: UIViewController)
}

class YYLoginViewController: YYBaseViewController {
    
    var backWay: YYLoginVCBackEnum = .dismiss
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func login(_ sender: Any) {
        let d = YYPresentationDelegate(animationType: .sheet, isShowMaskView: true, maskViewColor: UIColor.randomColor(0.3))
        let bundle = Bundle.ga_podBundle(aClass: PXPhotoSheetViewController.classForCoder(), resource: "GAAlertPresentation")
        let vc = PXPhotoSheetViewController(nibName: "PXPhotoSheetViewController", bundle: bundle, delegate: d)
        vc.clickedHandler = {
            tag, model in
            if (tag == 1) {
                self._finish()
            } else if (tag == 2) {
                self._finish()
            } else {
                
            }
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: UIButton) {
        _finish()
    }
    
    private func _finish() {
        switch backWay {
        case .pop:
            self.navigationController?.popViewController(animated: true)
            break
        case .dismiss:
            self.dismiss(animated: true, completion: nil)
            break
        case .root(let vc):
            UIApplication.shared.keyWindow?.rootViewController = vc
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}
