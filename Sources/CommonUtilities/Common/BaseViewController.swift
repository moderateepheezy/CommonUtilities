//
//  BaseViewController.swift
//  Lotus Capital
//
//  Created by Afees Lawal on 4/14/19.
//  Copyright © 2019 SimpuMind. All rights reserved.
//

import UIKit

// MARK: - BaseViewControllerSearchDelegate

/// The BaseViewControllerSearchDelegate is used when adding a Search Controller to
///
public protocol BaseViewControllerSearchDelegate: class {
    func getSearchText(text: String)
    func cancelSearch()
}

/// A UIViewController that loads a custom UIView as its .view
/// the typed view can be accessed via the .customView property
///
/// It also enforces a specific view model be provided upon creation
/// which can be accessed via the .viewModel property
open class BaseViewController<ViewType: UIView, ViewModelType>: UIViewController, UISearchBarDelegate {
    /// Provides typed access to the view controllers custom view
    public var customView: ViewType { return self.view as! ViewType }
    
    /// Provides typed access to the view controllers view model
    public let viewModel: ViewModelType
    
    /// Provides search bar to the navigation item
    public let searchController = UISearchController(searchResultsController: nil)
    
    /// BaseViewControllerDelegate to handle search updates and cancel search
    public weak var searchBarDelegate: BaseViewControllerSearchDelegate?
    
    // MARK - Lifecycle
    required public init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        fatalError("Must be initialised using init(viewModel:)")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Must be initialised using init(viewModel:)")
    }
    
    public override func loadView() {
        self.view = ViewType(frame: UIScreen.main.bounds)
    }
    
    /// Show a large title on iOS 11
    /// - Parameters:
    ///    - textColor: The *color* of the title text
    public func setupLargeTitle(textColor: UIColor, font: UIFont) {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : textColor, NSAttributedString.Key.font: font]
            self.navigationItem.largeTitleDisplayMode = .always
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - AddSearchController
    /// Add SearchBar to a UINavigation controller.
    /// This only works for iOS 11 >>>
    ///
    /// Please implement the BaseViewControllerSearchDelegate
    ///  To get text from search and to cancel the search controller
    /// - Parameters:
    ///    - searchBarTintColor: The *tint color* of the search bar

    public func addSearchController(tintColor: UIColor) {
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = tintColor
        searchController.searchBar.searchBarStyle = .prominent

        if #available(iOS 9.1, *) {
            searchController.obscuresBackgroundDuringPresentation = false
        }
        
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
            self.navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true
    }
    
    /// Add a Cancel Button to the right of a navigationItem
    // MARK: - Cancel Button Setup
    public func setupCancelBarButton() {
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = cancelBarButton
        
    }
    
    /// `handleCancel()` take
    @objc open func handleCancel() {}
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarDelegate?.cancelSearch()
    }
    
    public func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let textFieldText: NSString = (searchBar.text ?? "") as NSString
        let txtAfterUpdate = textFieldText.replacingCharacters(in: range, with: text)
        searchBarDelegate?.getSearchText(text: txtAfterUpdate)
        return true
    }
}

