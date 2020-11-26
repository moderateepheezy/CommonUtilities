//
//  BaseView.swift
//  Lotus Capital
//
//  Created by Afees Lawal on 4/15/19.
//  Copyright © 2019 SimpuMind. All rights reserved.
//

import UIKit

public class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
    }
}
