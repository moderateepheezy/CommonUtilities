//
//  Reusable.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation
import UIKit

public protocol Reusable {
    static var reuseIdentifier: String {get}
}

extension Reusable {
    public static var reuseIdentifier: String { return String(describing: self)}
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}
