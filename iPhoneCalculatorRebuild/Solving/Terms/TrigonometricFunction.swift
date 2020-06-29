//
//  TrigonometricFunction.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class TrigonometricFunction: SignCanToggle, DoubleValue, EvaluateFunction {
    
    //MARK: - Properties

    let functionName: CalculatorCell
    let unit: CalculatorCell.SIUnit
    var input1: Term
    
    //MARK: - Init

    init(functionName: CalculatorCell, input1: Term, unit: CalculatorCell.SIUnit) {
        self.functionName = functionName
        
        self.input1 = input1
        
        self.unit = unit
    }

    //MARK: - Methods

    func doubleValue() -> Double? {
        guard let evaluatedDouble = self.evaluateFunction() else { return nil }
        
        return self.toggleSign ? -evaluatedDouble : evaluatedDouble
    }
    
    func evaluateFunction() -> Double? {
        guard var input1Double: Double = self.input1.doubleValue else { return nil }
        
        if self.unit == .Degrees {
            input1Double *= (Double.pi/180)
        }
        
        switch self.functionName {
        case .trigonometricHyperbolicFunction(let function):
            switch function {
            case .Cosine:
                return cosh(input1Double)
            case .Sine:
                return sinh(input1Double)
            case .Tangent:
                return tanh(input1Double)
            }
        case .trigonometricInverseHyperbolicFunction(let function):
            switch function {
            case .Cosine:
                return acosh(input1Double)
            case .Sine:
                return asinh(input1Double)
            case .Tangent:
                return atanh(input1Double)
            }
        case .trigonometricInverseRightAngleFunction(let function):
            switch function {
            case .Cosine:
                return acos(input1Double)
            case .Sine:
                return asin(input1Double)
            case .Tangent:
                return atan(input1Double)
            }
        case .trigonometricRightAngleFunction(let function):
            switch function {
            case .Cosine:
                return cos(input1Double)
            case .Sine:
                return sin(input1Double)
            case .Tangent:
                return tan(input1Double)
            }
        default:
            return nil
        }
    }
}
