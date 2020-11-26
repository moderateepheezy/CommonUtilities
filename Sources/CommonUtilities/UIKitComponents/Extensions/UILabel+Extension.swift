//
//  UILabel+Extension.swift
//  UIKitComponents
//
//  Created by Afees Lawal on 05/09/2019.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import UIKit

extension UILabel {
    convenience public init(text: String? = nil, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
