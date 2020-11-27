//
//  BaseView.swift
//  Lotus Capital
//
//  Created by Afees Lawal on 4/15/19.
//  Copyright © 2019 SimpuMind. All rights reserved.
//

import UIKit

func abstractMethod() -> Never {
    fatalError("this method should be overriden")
}

open class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        setupViewHierarchy()
        setupConstraints()
        setupProperties()
    }

    public func setupViewHierarchy() {
        abstractMethod()
    }

    public func setupConstraints() {
        abstractMethod()
    }

    /// Optional method.
    public func setupProperties() { }
}
