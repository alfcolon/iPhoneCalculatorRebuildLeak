//
//  DummyLabelUniversalConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/4/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class DummyLabelUniversalConstraints: CalculatorConstraints {
        
    //MARK: - Properties
    
    let leading: NSLayoutConstraint
    let top: NSLayoutConstraint

    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let dummyLabel: DummyLabel! = viewControllerDelegate.labelView.outputLabel.dummyLabel
        let view: UIView! = viewControllerDelegate.view
        
        self.leading = dummyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        self.top = dummyLabel.topAnchor.constraint(equalTo: view.topAnchor)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
}
