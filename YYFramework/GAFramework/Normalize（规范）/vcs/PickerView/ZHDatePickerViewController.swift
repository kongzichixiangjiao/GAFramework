//
//  ZHDatePickerViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2019/2/20.
//  Copyright © 2019年 houjianan. All rights reserved.
//

import UIKit
import GAAlertPresentation

open class ZHDatePickerViewController: YYPresentationBaseViewController {

    public var kPickerViewHeigh: CGFloat = 350
    public var dataSource: [[String]] = [[String]]()
    public var config: GANormalizePickerViewConfig?
    public var dateFromateString = "yyyy-MM-dd" // HH-mm-ss
    
    lazy var pickerView: GANormalizeDatePickerView = {
        let v = GANormalizeDatePickerView.loadDatePickerView()
        v.frame = CGRect.zero
        v.datePickerViewClickedHandler = self.datePickerViewClickedHandler
        v.dateFormatString = self.dateFromateString
        v.titleString = "请选择日期"
        return v
    }()
    
    lazy var datePickerViewClickedHandler: GANormalizeDatePickerView.DatePickerViewClickedHandler = {
        [weak self] dateString, type in
        if let weakSelf = self {
            #if DEBUG
            print(dateString, type)
            #endif
            weakSelf.dismiss(animated: true, completion: nil)
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        isTapBack = false
        
        self.view.addSubview(pickerView)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pickerView.frame = CGRect(x: 0, y: self.view.frame.height - kPickerViewHeigh, width: self.view.width, height: kPickerViewHeigh)
    }
    
    deinit {
        print("ZHDatePickerViewController - deinit")
    }

}
