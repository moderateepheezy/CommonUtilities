//
//  TableViewCellRepresentable.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewCellRepresentable: TableViewCellViewModel {
    associatedtype TableViewCell: UITableViewCell
}

extension TableViewCellRepresentable where TableViewCell: Reusable {
    public static func register(with tableView: UITableView) {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }
    public func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath)
    }
}

extension UITableView {
    public func register(cells: [TableViewCellViewModel.Type]) {
        cells.forEach { $0.register(with: self) }
    }
}
