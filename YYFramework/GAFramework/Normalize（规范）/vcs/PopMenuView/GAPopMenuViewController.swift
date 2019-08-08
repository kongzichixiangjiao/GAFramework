//
//  GAPopMenuViewController.swift
//  YYFramework
//
//  Created by houjianan on 2019/4/9.
//  Copyright © 2019 houjianan. All rights reserved.
//

import UIKit

class GAPopMenuViewController: UIViewController {

    @IBOutlet weak var b: UIButton!
    var menuView: GAPopMenuView!
    
    var models: [GAPopMenuModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = GAPopMenuModel()
        model.title = "123"
        models = [model, model]
        
        menuView = GAPopMenuView(frame: CGRect.zero, models: models, targetView: b, cellHeight: 40, cellWidth: 200, handler: { (row) in
            self.b.setTitle(self.models[0].title, for: .normal)
        })
        menuView.isHidden = true
        self.view.addSubview(menuView)
    }
    
    @IBAction func ac(_ sender: Any) {
        menuView.show(models: models)
    }
    
}
