//
//  OutputLabelUniversalConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class OutputLabelUniversalConstraints: CalculatorConstraints {
 
    //MARK: - Properties
    
    let bottom: NSLayoutConstraint
    let leading: NSLayoutConstraint

    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let outputLabel: OutputLabel! = viewControllerDelegate.labelView.outputLabel
        let labelView: UIView! = viewControllerDelegate.labelView
        
        self.bottom = outputLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 0)
        
        self.leading = outputLabel.leadingAnchor.constraint(greaterThanOrEqualTo: labelView.safeAreaLayoutGuide.leadingAnchor)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
        
    }
}
