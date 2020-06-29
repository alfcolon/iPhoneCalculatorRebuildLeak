//
//  OutputLabelConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class OutputLabelConstraints {
    
    //MARK: - Properties
    
    let landscape: OutputLabelLandscapeConstraints
    let portrait: OutputLabelPortraitConstraints
    let universal: OutputLabelUniversalConstraints
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.landscape = OutputLabelLandscapeConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.portrait = OutputLabelPortraitConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.universal = OutputLabelUniversalConstraints(viewControllerDelegate: viewControllerDelegate)
    }
}
