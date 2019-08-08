//
//  YYMosaicViewController.swift
//  YYImageStitching
//
//  Created by 侯佳男 on 2018/6/5.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import UIKit

protocol YYMosaicViewControllerDelegate: class {
    func mosaicViewControllerGet(resultsImageView: UIImageView)
}

class YYMosaicViewController: YYBaseViewController {

    weak var delegate: YYMosaicViewControllerDelegate?
    
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
            delegate?.mosaicViewControllerGet(resultsImageView: imageV)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mosaic()
    }
    
    func mosaic() {
        mosaicView.surfaceImage = UIColor.white.ga_image(viewSize: mosaicView.bounds.size)
        mosaicView.image = UIColor.black.ga_image(viewSize: mosaicView.bounds.size)
    }

    lazy var mosaicView: YYMosaicView = {
        let v = YYMosaicView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height - 100))
        self.view.addSubview(v)
        return v
    }()
    
    @IBAction func save(_ sender: UIButton) {
        imageV.image = mosaicView.getSaveView()
        imageV.isHidden = !imageV.isHidden
        mosaicView.isHidden = !mosaicView.isHidden
    }
    @IBAction func preStep(_ sender: Any) {
        mosaicView.preStep()
    }
    
    @IBAction func reset(_ sender: Any) {
        mosaicView.reset()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
