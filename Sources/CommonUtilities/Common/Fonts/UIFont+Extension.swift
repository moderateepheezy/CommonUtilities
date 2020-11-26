//
//  UIFont+Extension.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation
import UIKit

public extension UIFont {
    
    convenience init?(font: Fonts, size: CGFloat) {
        let fontIdentifier: String = font.rawValue
        self.init(name: fontIdentifier, size: size)
    }
    
    class func regular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "OpenSans-Regular", size: size)
    }
    
    class func bold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "OpenSans-Bold", size: size)
    }
    
    class func extraBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "OpenSans-ExtraBold", size: size)
    }
    
    class func italic(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "OpenSans-Italic", size: size)
    }
    
    class func semiBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "OpenSans-Semibold", size: size)
    }
    
    class func light(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "OpenSans-Light", size: size)
    }
    
    class func avenirLight(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Avenir-Light", size: size)
    }
    
    class func avenirMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Avenir-Medium", size: size)
    }
}
