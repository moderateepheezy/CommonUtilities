//
//  ImageTextVerticalButton.swift
//  UIKitComponents
//
//  Created by Afees Lawal on 05/09/2019.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import UIKit

class ImageTextVerticalButton: UIControl {

    var elevation: CGFloat = 0 {
        didSet {
            rippleLayer.elevation = elevation
        }
    }
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            rippleLayer.superLayerDidResize()
        }
    }
    
    var shadowOffset: CGSize = .zero {
        didSet {
            rippleLayer.shadowOffset = shadowOffset
        }
    }
    
    var roundingCorners: UIRectCorner = UIRectCorner.allCorners {
        didSet {
            rippleLayer.roundingCorners = roundingCorners
        }
    }
    
    var maskEnabled: Bool = true {
        didSet {
            rippleLayer.maskEnabled = maskEnabled
        }
    }
    
    var rippleScaleRatio: CGFloat = 1.0 {
        didSet {
            rippleLayer.rippleScaleRatio = rippleScaleRatio
        }
    }
    
    var rippleDuration: CFTimeInterval = 0.35 {
        didSet {
            rippleLayer.rippleDuration = rippleDuration
        }
    }
    
    var rippleEnabled: Bool = true {
        didSet {
            rippleLayer.rippleEnabled = rippleEnabled
        }
    }
    
    var rippleLayerColor: UIColor = .lightGray {
        didSet {
            rippleLayer.setRippleColor(color: rippleLayerColor)
        }
    }
    
    var backgroundAnimationEnabled: Bool = true {
        didSet {
            rippleLayer.backgroundAnimationEnabled = backgroundAnimationEnabled
        }
    }
    
    override var bounds: CGRect {
        didSet {
            rippleLayer.superLayerDidResize()
        }
    }
    
    lazy var rippleLayer: RippleLayer = RippleLayer(withView: self)
    
    var imageView = UIImageView()
    var label = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }
    
    private func defaultSetup() {
        setupLayer()
        [label, imageView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    fileprivate func setupLayer() {
        rippleLayer.elevation = self.elevation
        self.layer.cornerRadius = self.cornerRadius
        rippleLayer.elevationOffset = self.shadowOffset
        rippleLayer.roundingCorners = self.roundingCorners
        rippleLayer.maskEnabled = self.maskEnabled
        rippleLayer.rippleScaleRatio = self.rippleScaleRatio
        rippleLayer.rippleDuration = self.rippleDuration
        rippleLayer.rippleEnabled = self.rippleEnabled
        rippleLayer.backgroundAnimationEnabled = self.backgroundAnimationEnabled
        rippleLayer.setRippleColor(color: self.rippleLayerColor)
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.frame.width
        let height = self.frame.height
        imageView.contentMode = .scaleAspectFit
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.03 * height).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.1 * width).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -0.1 * width).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0.05 * height).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.1 * width).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -0.1 * width).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0.03 * height).isActive = true
        self.layoutIfNeeded()
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        rippleLayer.touchesBegan(touches: touches, withEvent: event)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        rippleLayer.touchesEnded(touches: touches, withEvent: event)
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        rippleLayer.touchesCancelled(touches: touches, withEvent: event)
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        rippleLayer.touchesMoved(touches: touches, withEvent: event)
    }
}
