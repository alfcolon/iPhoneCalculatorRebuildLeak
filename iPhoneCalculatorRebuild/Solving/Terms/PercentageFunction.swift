//
//  PercentageFunction.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class PercentageFunction: SignCanToggle, DoubleValue, EvaluateFunction {
        
    //MARK: - Properties
    
    var of: Double?
    var percent: Double?
    
    //MARK: - Init
    
    init(
        of: Double?,
        percent: Double? = 1.0
    ) {
        self.of = of
        self.percent = percent
    }
    
    //MARK: - Methods

    func doubleValue() -> Double? {
        guard let evaluatedDouble = self.evaluateFunction() else { return nil }

        return self.toggleSign ? -evaluatedDouble : evaluatedDouble
    }
    
    func evaluateFunction() -> Double? {
        guard let of = self.of else { return nil }
        guard let percent = self.percent else { return nil }
        
        return of * (percent / 100)
    }
    
    func update() {
        guard var percent = self.percent else { return }
        
        percent /= 100
        self.percent = percent
    }
}
