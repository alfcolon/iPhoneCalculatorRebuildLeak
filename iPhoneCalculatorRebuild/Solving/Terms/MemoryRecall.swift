//
//  MemoryRecall.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class MemoryRecall: SignCanToggle, DoubleValue  {

    //MARK: - Properties
    
    var double: Double?
    
    //MARK: - Init
    
    init(double: Double? = 0) {
        self.double = double
    }
    
    //MARK: - Double Value
    
    func doubleValue() -> Double? {
        return self.double
    }
    
    //MARK: - Methods

    func addToMemoryRecall(double: Double?) {
        let total: Double? = CalculatorCell.Operator.Addition.evaluate(leftTermDouble: self.double, rightTermDouble: double)
        self.double = total
    }

    func clear() {
        self.double = 0
        self.toggleSign = false
    }

    func subtractFromMemoryRecall(double: Double?) {
        let total: Double? = CalculatorCell.Operator.Addition.evaluate(leftTermDouble: self.double, rightTermDouble: double)
        self.double = total
    }
}
