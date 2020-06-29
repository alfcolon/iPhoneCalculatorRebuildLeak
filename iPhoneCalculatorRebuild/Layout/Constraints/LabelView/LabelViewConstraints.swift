//
//  LabelViewConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/12/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class LabelViewConstraints {
    
    //MARK: - Properties
    
    let landscape: LabelViewLandscapeConstraints
    let universal: LabelViewUniversalConstraints
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.landscape = LabelViewLandscapeConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.universal = LabelViewUniversalConstraints(viewControllerDelegate: viewControllerDelegate)
    }
}
