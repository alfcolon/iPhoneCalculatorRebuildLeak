//
//  FixedOperand.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class FixedOperand: SignCanToggle, DoubleValue {
    
    //MARK: - Properties
    
    let double: Double?
    
    //MARK: - Init
    
    init(double: Double?) {
        self.double = double
    }
    
    //MARK: - Methods
    
    func doubleValue() -> Double? {
        guard self.double != nil else { return nil }
        
        return self.toggleSign ? -self.double! : self.double!
    }
}
