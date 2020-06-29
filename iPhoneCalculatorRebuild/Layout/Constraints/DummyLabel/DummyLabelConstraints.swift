//
//  DummyLabelConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class DummyLabelConstraints {
    
    //MARK: - Properties
    
    let universal: DummyLabelUniversalConstraints
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.universal = DummyLabelUniversalConstraints(viewControllerDelegate: viewControllerDelegate)
    }
}
