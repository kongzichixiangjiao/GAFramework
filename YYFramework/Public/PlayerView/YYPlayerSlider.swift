//
//  LYPlayerSlider.swift
//
//  Copyright © 2017年 ly_coder. All rights reserved.
//
//  GitHub地址：https://github.com/LY-Coder/LYPlayer
//

import UIKit

protocol YYPlayerSliderDelegate: class {
    func playerSliderBegan(progress: CGFloat)
    func playerSliderChanged(progress: CGFloat)
    func playerSliderEnd(progress: CGFloat)
}

class YYPlayerSlider: UIControl {
    
    weak var delegate: YYPlayerSliderDelegate?
    
    @IBInspectable var progressColor: UIColor = UIColor.blue
    @IBInspectable var dragColor: UIColor = UIColor.blue
    @IBInspectable var dragWidth: CGFloat = 10.0
    @IBInspectable var progress: CGFloat = 0.0
    
    private var isContains: Bool?
    
    
    var progressLayer: CAShapeLayer = CAShapeLayer()
    var dragProgressLayer: CAShapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        _setupPlayProgressViewWidth(progress: progress)
        
        progressLayer.fillColor = progressColor.cgColor
        let path = UIBezierPath(rect: CGRect(x: 0, y: self.frame.size.height / 2 - 2 / 2, width: progress * self.frame.size.width, height: 2))
        progressLayer.path = path.cgPath
        self.layer.addSublayer(progressLayer)
        
        dragProgressLayer.fillColor = dragColor.cgColor
        let dragPath = UIBezierPath(roundedRect: CGRect(x: progress * self.frame.size.width - 10 / 2, y: self.frame.size.height / 2 - 10 / 2, width: 10, height: 10), cornerRadius: 5)
        dragProgressLayer.path = dragPath.cgPath
        self.layer.addSublayer(dragProgressLayer)
    }

    private func _image(color: UIColor, viewSize: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for touch in touches {
            let point = touch.location(in: self)
            isContains = dragProgressLayer.path?.contains(point)
            progress = point.x / frame.width
            _setupPlayProgressViewWidth(progress: progress)
        }
        delegate?.playerSliderBegan(progress: progress)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        for touch in touches {
            let point = touch.location(in: self)
            if isContains! && point.x > 0 && point.x < frame.width {
                progress = point.x / frame.width
                _setupPlayProgressViewWidth(progress: progress)
                delegate?.playerSliderChanged(progress: progress)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        delegate?.playerSliderEnd(progress: progress)
    }
    
    private func _setupPlayProgressViewWidth(progress: CGFloat) {
        if progress == 0 {
            return
        }
        
        let dragPath = UIBezierPath(roundedRect: CGRect(x: progress * self.frame.size.width - 10 / 2, y: self.frame.size.height / 2 - 10 / 2, width: 10, height: 10), cornerRadius: 5)
        dragProgressLayer.path = dragPath.cgPath
        
        let path = UIBezierPath(rect: CGRect(x: 0, y: self.frame.size.height / 2 - 2 / 2, width: CGFloat(String(format: "%.2f", progress).toDouble()!) * frame.width, height: 2))
        progressLayer.path = path.cgPath
    }

    public func setupProgress(_ progress: CGFloat) {
        _setupPlayProgressViewWidth(progress: progress)
    }
}
