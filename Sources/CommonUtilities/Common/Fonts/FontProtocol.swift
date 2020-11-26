//
//  FontProtocol.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation
import UIKit

public protocol FontProtocol: RawRepresentable {}

extension FontProtocol where Self.RawValue == String {
    
    /// Another way to get a UIFont instance from a Fonts object
    ///
    /// - Parameter size: Desired value of the font size
    /// - Returns: An instance of UIFont with size, or nil
    ///    if the font is not installed
    public func size(_ size: CGFloat) -> UIFont? {
        return UIFont(name: rawValue, size: size)
    }
}

