//
//  YYMosaicView.swift
//  YYImageStitching
//
//  Created by 侯佳男 on 2018/6/5.
//  Copyright © 2018年 侯佳男. All rights reserved.
//  签名View

import UIKit

open class YYMosaicView: UIView {

    var saveView: UIView = {
        let v = UIView()
        return v
    }()
    
    var image: UIImage! {
        didSet {
            self.imageLayer.contents = image.cgImage
        }
    }
    
    var surfaceImage: UIImage!   {
        didSet {
            self.imageView.image = surfaceImage
            self.imageView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.saveView.bounds.width, height: self.saveView.bounds.width / surfaceImage.width * surfaceImage.height))
            self.imageView.center = self.saveView.center
        }
    }
    
    lazy var imageView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = UIColor.orange
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var imageLayer: CALayer = {
        let v = CALayer()
        return v
    }()
    
    var shapeLayer: CAShapeLayer = {
        let v = CAShapeLayer()
        v.lineCap = CAShapeLayerLineCap.round
        v.lineJoin = CAShapeLayerLineJoin.round
        v.lineWidth = 5.0
        v.strokeColor = UIColor.black.cgColor
        v.fillColor = UIColor.clear.cgColor
        return v
    }()
    
    var path: CGMutablePath = CGMutablePath()
    var appendPaths: [[String : [CGPoint]]] = []
    var paths: [String : [CGPoint]] = ["":[CGPoint.zero]]
    var movePoint: [CGPoint] = []
    private let space: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    private func initViews() {
        
        saveView.frame = CGRect(x: space, y: space, width: self.bounds.width - space * 2, height: self.bounds.height - space * 2)
        self.addSubview(saveView)
        
        saveView.addSubview(imageView)
        
        imageLayer.frame = self.saveView.bounds
        self.imageView.layer.addSublayer(imageLayer)
        
        shapeLayer.frame = self.saveView.bounds
        self.imageView.layer.addSublayer(shapeLayer)
        
        self.imageLayer.mask = self.shapeLayer
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first
        let point = touch?.location(in: self)
        if !self.imageView.frame.contains(point!) {
            return
        }
        self.path.move(to: CGPoint(x: point!.x - space, y: point!.y - space - (self.saveView.height / 2 - self.imageView.height / 2)))
        self.shapeLayer.path = self.path.mutableCopy()
        paths["begin"] = [point] as? [CGPoint]
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first
        let point = touch?.location(in: self)
        if !self.imageView.frame.contains(point!) {
            return
        }
        self.path.addLine(to: CGPoint(x: point!.x - space, y: point!.y - space - (self.saveView.height / 2 - self.imageView.height / 2)))
        self.shapeLayer.path = self.path.mutableCopy()
        movePoint.append(point!)
        paths["move"] = movePoint
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let touch = touches.first
        let point = touch?.location(in: self)
        paths["end"] = [CGPoint(x: point!.x - space, y: point!.y - space - (self.saveView.height / 2 - self.imageView.height / 2))]
        appendPaths.append(paths)
        
        movePoint.removeAll()
        paths.removeAll()
    }
    
    @objc func reset() {
        self.path = CGMutablePath()
        self.shapeLayer.path = self.path.mutableCopy()
        appendPaths.removeAll()
    }
    
    @objc func preStep() {
        if appendPaths.count == 0 {
            return
        }
        appendPaths.removeLast()
        if appendPaths.count == 0 {
            reset()
            return
        }
        let newPath = CGMutablePath()
        for i in 0..<appendPaths.count {
            let path = appendPaths[i]
            guard let begin = path["begin"]?.first else {
                return
            }
            guard let _ = path["end"]?.first else {
                return
            }
            guard let move = path["move"] else {
                return
            }
            newPath.move(to: CGPoint(x: begin.x, y: begin.y))
            for p in move {
                newPath.addLine(to: p)
            }
            shapeLayer.path = newPath.mutableCopy()
            self.path = newPath.mutableCopy()!
        }
    }
    
    func getSaveView() -> UIImage {
        return _screenshot(size: self.imageView.size)!
    }
    
    private func _screenshot(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        //        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
