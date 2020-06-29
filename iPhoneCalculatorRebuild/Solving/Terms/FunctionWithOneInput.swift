//
//  FunctionWithOneInput.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class FunctionWithOneInput: SignCanToggle, DoubleValue, EvaluateFunction {
    
    //MARK: - Properties

    let functionName: CalculatorCell
    var input1: Term
    
    //MARK: - Init

    init(functionName: CalculatorCell, input1: Term) {
        self.functionName = functionName
        
        self.input1 = input1
    }

    //MARK: - Methods

    func doubleValue() -> Double? {
        guard let evaluatedDouble = self.evaluateFunction() else { return nil }

        return self.toggleSign ? -evaluatedDouble : evaluatedDouble
    }
    
    //MARK: Evaluate Function
    
    func evaluateFunction() -> Double? {
        guard let input1Double: Double = self.input1.doubleValue else { return nil }
        
        switch self.functionName {
        case .exponentFunction(let function):
            switch function {
            case .BaseEulersNumberPowerX:
                return pow(input1Double, Darwin.M_E)
            case .BaseTenPowerX:
                return pow(input1Double, 10)
            case .BaseTwoPowerX:
                return pow(2, input1Double)
            case .BaseXPowerThree:
                return pow(input1Double, 3)
            case .BaseXPowerTwo:
                return pow(input1Double, 2)
            default:
                return nil
            }
        case .factorial:
            //1.Avoid using factorial on numbers with a decimal value > 0
            guard input1Double.rounded() == input1Double else { return nil }

            func factorial(double: Double) -> Double {
                return double == 0 ? 1 : double * factorial(double: double - 1)
            }
            return factorial(double: input1Double)
        case .logFunction(let function):
            switch function {
            case .LogBaseTen:
                return log10(input1Double)
            case .LogBaseTwo:
                return log2(input1Double)
            case .NaturalLog:
                return log(input1Double)
            default:
                return nil
            }
        case .reciprocal:
            guard input1Double != 0 else { return nil }
            return 1 / input1Double
        case .rootFunction(let function):
            switch function {
            case .CoefficientThreeRadicandX:
                return cbrt(input1Double)
            case .CoefficientTwoRadicandX:
                return sqrt(input1Double)
            default:
                return nil
            }
        default:
            return nil
        }
    }
}
