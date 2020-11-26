//
//  CollectionViewViewModelConfigurable.swift
//  Lotus Capital
//
//  Created by Afees Lawal on 4/14/19.
//  Copyright © 2019 SimpuMind. All rights reserved.
//

import UIKit

public protocol CollectionViewViewModelConfigurable {
    associatedtype ViewModel
    
    func configure(with viewModel: ViewModel)
}

public extension CollectionViewCellRepresentable where CollectionViewCell: CollectionViewViewModelConfigurable & Reusable, CollectionViewCell.ViewModel == Self {
    func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
            else { fatalError("Unable to dequeue a cell of type '\(CollectionViewCell.self)'") }
        
        cell.configure(with: self)
        
        return cell
    }
}

