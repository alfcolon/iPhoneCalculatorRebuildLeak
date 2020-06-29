//
//  LabelViewLandscapeConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/12/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class LabelViewLandscapeConstraints: CalculatorConstraints {
    
    //MARK: - Properties
    
    let height: NSLayoutConstraint
    
    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
    
        self.height = labelView.heightAnchor.constraint(equalToConstant: 60)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
}
