//
//  GACalenderControlHeaderView.swift
//  YYFramework
//
//  Created by houjianan on 2019/5/18.
//  Copyright © 2019 houjianan. All rights reserved.
//

import UIKit

protocol GACalenderControlHeaderViewDelegate: class {
    func calenderControlHeaderView_left()
    func calenderControlHeaderView_right()
    func calenderControlHeaderView_title()
}

class GACalenderControlHeaderView: UIView {

    static let height: CGFloat = 50
    
    @IBOutlet weak var ymLabel: UILabel!
    weak var delegate: GACalenderControlHeaderViewDelegate?
    
    @IBAction func rightAction(_ sender: UIButton) {
        delegate?.calenderControlHeaderView_right()
    }
    
    @IBAction func leftAction(_ sender: UIButton) {
        delegate?.calenderControlHeaderView_left()
    }
    
    @IBAction func titleAction(_ sender: UIButton) {
        delegate?.calenderControlHeaderView_title()
    }
    
}
