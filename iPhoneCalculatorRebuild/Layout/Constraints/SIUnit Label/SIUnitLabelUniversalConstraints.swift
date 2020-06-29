//
//  SIUnitLabelUniversalConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/4/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class SIUnitLabelUniversalConstraints: CalculatorConstraints {
    
    //MARK: - Properties
    
    let bottom: NSLayoutConstraint
    
    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
        let siUnitLabel: SIUnitLabel! = viewControllerDelegate.labelView.siUnitLabel
        
        self.bottom = siUnitLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 0)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
}
