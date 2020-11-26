//
//  CircularImageView.swift
//  UIKitComponents
//
//  Created by Afees Lawal on 05/09/2019.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import UIKit

open class CircularImageView: UIImageView {
    
    public init(width: CGFloat, image: UIImage? = nil) {
        super.init(image: image)
        contentMode = .scaleAspectFill
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        clipsToBounds = true
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("you can only instantiate with init(width:, image:)")
    }
    
}
