//
//  FunctionWithTwoInputs.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class FunctionWithTwoInputs: SignCanToggle, DoubleValue, EvaluateFunction {
    
    //MARK: - Properties

    let functionName: CalculatorCell
    var input1: Term
    var input2: Term

    
    //MARK: - Init

    init(functionName: CalculatorCell, input1: Term) {
        self.functionName = functionName
        
        self.input1 = input1
        
        self.input2 = Term.ThisTermNeedsToBeSet
    }
    
    //MARK: - Methods
    
    func doubleValue() -> Double? {
        guard let evaluatedDouble = self.evaluateFunction() else { return nil }

        return self.toggleSign ? -evaluatedDouble : evaluatedDouble
    }
    
    //MARK: Evaluate Function
    
    func evaluateFunction() -> Double? {
        guard let input1Double = self.input1.doubleValue else { return nil }
        guard let input2Double = self.input2.doubleValue else { return nil }
        
        switch functionName {
        case .exponentFunction(let function):
            switch function {
            case .BaseXPowerY:
                return pow(input1Double, input2Double)
            case .BaseYPowerX:
                return pow(input2Double, input1Double)
            case .EnterExponent:
                return pow(10, input2Double) * input1Double
            default:
                return nil
            }
        case .logFunction(let function):
            switch function {
            case .LogBaseY:
                return log(input1Double) / log(input2Double)
            default:
                return nil
            }
        case .rootFunction(let function):
            switch function {
            case .CoefficientYRadicandX:
                return pow(input1Double, 1 / input2Double)
            default:
                return nil
            }
        default:
            return nil
        }
    }
}
