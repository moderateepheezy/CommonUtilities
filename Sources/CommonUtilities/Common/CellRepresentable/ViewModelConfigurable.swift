//
//  ViewModelConfigurable.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import UIKit

public protocol ViewModelConfigurable {
    associatedtype ViewModel
    
    func configure(with viewModel: ViewModel)
}

extension TableViewCellRepresentable where TableViewCell: ViewModelConfigurable & Reusable, TableViewCell.ViewModel == Self {
    func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell
            else { fatalError("Unable to dequeue a cell of type '\(TableViewCell.self)'") }
        
        cell.configure(with: self)
        
        return cell
    }
}

