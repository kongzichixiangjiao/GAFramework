//
//  UIViewExtension.swift
//  GA_ReloadSection
//
//  Created by houjianan on 16/8/5.
//  Copyright © 2016年 houjianan. All rights reserved.
//

/*
 *  初始化xib view方法
 *  裁剪view（滚动、不可滚动）圆角 描边
 *  view基础属性
 *  xib view的基本属性
 *  上下左右添加分割线
 */

import UIKit

// 初始化xib View
extension UIView {
    
    public class func ga_xibViewFrom<T: UIView>(_ viewType: T.Type) -> T {
        return Bundle.main.loadNibNamed(String(describing: viewType), owner: nil, options: nil)?.first as! T
    }
    
    public class func ga_xibView() -> Self {
        return ga_xibViewFrom(self)
    }
}

// MARK:  裁剪 view 的圆角
extension UIView {
    // 圆角（单个） - 可以滚动的视图不能用这个方法
    func ga_clipStaticViewRectCorner(_ direction: UIRectCorner, cornerRadius: CGFloat) {
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    // 圆角
    func ga_clipRectCorner(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    // 描边
    func ga_strokeBorder(_ width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

// MARK: width  height  x  y
extension UIView {
    
    var top: CGFloat {
        set {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
        get {
            return self.frame.origin.y
        }
    }
    var left: CGFloat {
        set {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var bottom: CGFloat {
        set {
            var rect = self.frame
            rect.origin.y = newValue - self.frame.size.height
            self.frame = rect
        }
        get {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    var right: CGFloat {
        set {
            var rect = self.frame
            rect.origin.x = newValue - self.frame.size.width
            self.frame = rect
        }
        get {
            return self.frame.origin.x + self.frame.size.width
        }
    }
    
    
    var origin: CGPoint {
        set {
            var rect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
        get {
            return self.frame.origin
        }
    }
    
    var screenFrame: CGRect {
        return self.convert(self.bounds, to: nil)
    }
    
    var screenX: CGFloat {
        return self.screenFrame.origin.x
    }
    
    var screenY: CGFloat {
        return self.screenFrame.origin.y
    }
    
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
    var maxY: CGFloat {
        get {
            return height + y
        }
    }
    
    var maxX: CGFloat {
        get {
            return width + x
        }
    }
    
}


// MARK: Bundle.main.loadNibNamed
extension UIView {
    class func ga_loadView() -> UIView {
        return Bundle.main.loadNibNamed(self.ga_nameOfClass, owner: self, options: nil)?.last as! UIView
    }
}

// MARK: Xib 属性设置
protocol UIViewExtensionProtocol {
    var ga_cornerRadius: CGFloat {get set}
    
    var ga_masksToBounds: Bool {get set}
    
    var ga_borderWidth: CGFloat {get set}
    var ga_borderColor: UIColor {get set}
    
    var ga_shadowColor: UIColor {get set}
    var ga_shadowOpacity: CGFloat {get set}
    var ga_shadowOffset: CGSize {get set}
    var ga_shadowRadius: CGFloat {get set}
}

extension UIView: UIViewExtensionProtocol {
    @IBInspectable var ga_cornerRadius: CGFloat {
        get {
            return  self.ga_cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var ga_borderWidth: CGFloat {
        get {
            return self.ga_borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var ga_masksToBounds: Bool {
        get {
            return self.ga_masksToBounds
        }
        set {
            self.layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var ga_borderColor: UIColor {
        get {
            return self.ga_borderColor
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var ga_shadowColor: UIColor {
        get {
            return self.ga_shadowColor
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var ga_shadowOpacity: CGFloat {
        get {
            return self.ga_shadowOpacity
        }
        set {
            self.layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable var ga_shadowOffset: CGSize {
        get {
            return self.ga_shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var ga_shadowRadius: CGFloat {
        get {
            return self.ga_shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
}

// MARK: 1、分割线设置  2、ga_show()
enum LineViewPosition {
    case top, bottom, left, right
}

extension UIView {
    
    static var kLineViewKey: UInt = 151001
    
    func ga_showLineView(_ space: CGFloat, position: LineViewPosition = .bottom, color: UIColor = UIColor.lightGray) {
        if let _ = objc_getAssociatedObject(self, &UIView.kLineViewKey) {
            return
        }
        let h = 1.0 / UIScreen.main.scale
        
        let lineView = UIView(frame: CGRect(x: space, y: position == .top ? 0 : self.frame.size.height - 1, width: self.frame.size.width - space * 2, height: h))
        lineView.backgroundColor = color
        self.addSubview(lineView)
        
        objc_setAssociatedObject(self, &UIView.kLineViewKey, lineView, .OBJC_ASSOCIATION_RETAIN)
    }
    
    func ga_clickCircle() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    func ga_show() {
        #if DEBUG
        print(self)
        #endif
    }
    
}

extension UIView {
    func yy_view(title: String = "") {
        #if DEBUG
        let v = UILabel()
        v.backgroundColor = UIColor.orange
        v.text = (title == "" ? self.ga_nameOfClass : title)
        v.font = UIFont.systemFont(ofSize: 14)
        v.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        self.addSubview(v)
        #endif
    }
}

