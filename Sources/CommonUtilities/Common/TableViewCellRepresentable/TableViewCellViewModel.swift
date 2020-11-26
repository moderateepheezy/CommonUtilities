//
//  TableViewCellViewModel.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewCellViewModel {
    static func register(with tableView: UITableView)
    func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    func selected()
}

extension TableViewCellViewModel {
    public func selected() { }
}
