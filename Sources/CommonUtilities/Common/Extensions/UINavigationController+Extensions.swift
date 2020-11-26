//
//  UINavigationController+Extensions.swift
//  Sivvar
//
//  Created by Afees Lawal on 7/10/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import UIKit

public extension UINavigationController {
    var shouldAnimate: Bool { return !self.viewControllers.isEmpty }
}
