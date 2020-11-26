//
//  UIColor+Extension.swift
//  Common
//
//  Created by Afees Lawal on 05/09/2019.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static public func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
