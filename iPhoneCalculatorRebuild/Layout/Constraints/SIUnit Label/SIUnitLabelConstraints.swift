//
//  SIUnitLabelConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class SIUnitLabelConstraints {
    
    //MARK: - Properties
    
    let landscape: SIUnitLabelConstraintsLandscapeConstraints
    let portrait: SIUnitLabelConstraintsPortraitConstraints
    let universal: SIUnitLabelUniversalConstraints
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.landscape = SIUnitLabelConstraintsLandscapeConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.portrait = SIUnitLabelConstraintsPortraitConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.universal = SIUnitLabelUniversalConstraints(viewControllerDelegate: viewControllerDelegate)
    }
}
