//
//  StandardCalculatorCollectionViewConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class StandardCalculatorCollectionViewConstraints {
    
    //MARK: - Properties
    
    let portrait: StandardCalculatorCollectionViewPortraitConstraints
    let universal: StandardCalculatorCollectionViewUniversalConstraints
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.portrait = StandardCalculatorCollectionViewPortraitConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.universal = StandardCalculatorCollectionViewUniversalConstraints(viewControllerDelegate: viewControllerDelegate)
    }
}
