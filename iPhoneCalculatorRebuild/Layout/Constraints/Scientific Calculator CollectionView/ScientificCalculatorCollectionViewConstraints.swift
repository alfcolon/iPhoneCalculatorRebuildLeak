//
//  ScientificCalculatorCollectionViewConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class ScientificCalculatorCollectionViewConstraints {
    
    //MARK: - Properties
    
    let landscape: ScientificCalculatorCollectionViewLandscapeConstraints
    let universal: ScientificCalculatorCollectionViewUniversalConstraints
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.landscape = ScientificCalculatorCollectionViewLandscapeConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.universal = ScientificCalculatorCollectionViewUniversalConstraints(viewControllerDelegate: viewControllerDelegate)
    }
}
