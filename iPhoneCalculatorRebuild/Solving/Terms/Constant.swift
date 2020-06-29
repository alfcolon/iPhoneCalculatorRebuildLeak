//
//  Constant.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class Constant: SignCanToggle, DoubleValue {
    
    //MARK: - Properties
    
    let constantType: CalculatorCell.Constant!
    
    //MARK: - Init
    
    init(constantType: CalculatorCell.Constant) {
        self.constantType = constantType
    }
    
    //MARK: - Methods
    
    func doubleValue() -> Double? {
        var constantDouble: Double! {
            switch constantType! {
            case .EulersNumber:
                return Darwin.M_E
            case .RandomNumber:
                return Double.random(in: 0..<1)
            case .Pi:
                return Double.pi
            }
        }
        return self.toggleSign ? -constantDouble : constantDouble
    }
}
