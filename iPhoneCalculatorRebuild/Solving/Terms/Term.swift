//
//  Term.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

enum Term {
    case ThisTermNeedsToBeSet
    case constantOperand(Constant)
    case fixedOperand(FixedOperand)
    case functionWithOneInput(FunctionWithOneInput)
    case functionWithTwoInputs(FunctionWithTwoInputs)
    case memoryReserve(MemoryRecall)
    case mutableOperand(MutableOperand)
    case operation(Operation)
    case nestedArithmeticController(ArithmeticController)
    case percentageFunction(PercentageFunction)
    case trigonometricFunction(TrigonometricFunction)
    indirect case finalExpression(Term)
    indirect case precedenceOperationTotal(leftTerm: Term, operator_: CalculatorCell.Operator, rightTerm: Term)
    
    //MARK: - Init Methods
    
    init(constantType: CalculatorCell.Constant) {
        self = Term.constantOperand(Constant(constantType: constantType))
    }
    
    init(double: Double?) {
        self = Term.fixedOperand(FixedOperand(double: double))
    }
    
    init(functionWithOneInput: CalculatorCell, input1: Term) {
        self = Term.functionWithOneInput(FunctionWithOneInput(functionName: functionWithOneInput, input1: input1))
    }
    
    init(functionWithTwoInputs: CalculatorCell, input1: Term) {
        self = Term.functionWithTwoInputs(FunctionWithTwoInputs(functionName: functionWithTwoInputs, input1: input1))
    }
    
    init(decimal: CalculatorCell.Decimal? = nil, startingDigit: CalculatorCell.Digit = CalculatorCell.Digit.Zero, toggleSign: Bool = false) {
        self = Term.mutableOperand(MutableOperand(decimal: decimal, startingDigit: startingDigit, toggleSign: toggleSign))
    }
    
    init(leftTermDouble: Double?, operatorType: CalculatorCell.Operator, rightTermDouble: Double?) {
        self = Term.operation(Operation(leftTermDouble: leftTermDouble, operatorType: operatorType, rightTermDouble: rightTermDouble))
    }
    
    init(nestedArithmeticController: ArithmeticController) {
        self = Term.nestedArithmeticController(nestedArithmeticController)
    }
    
    init(percentageFunction: PercentageFunction) {
        self = Term.percentageFunction(percentageFunction)
    }

    init(trigonometricFunction: CalculatorCell, input1: Term, unit: CalculatorCell.SIUnit) {
        self = Term.trigonometricFunction(TrigonometricFunction(functionName: trigonometricFunction, input1: input1, unit: unit))
    }
    
    //MARK: - Mutating Value of Self Methods
    
    mutating func updateTerm(to constantType: CalculatorCell.Constant) {
        self = Term.constantOperand(Constant(constantType: constantType))
    }
    
    mutating func updateTerm(to double: Double?) {
        self = Term.fixedOperand(FixedOperand(double: double))
    }
    
    mutating func updateTerm(functionWithOneInput: CalculatorCell, input1: Term) {
        self = Term.functionWithOneInput(FunctionWithOneInput(functionName: functionWithOneInput, input1: input1))
    }
    
    mutating func updateTerm(functionWithTwoInputs: CalculatorCell, input1: Term) {
        self = Term.functionWithTwoInputs(FunctionWithTwoInputs(functionName: functionWithTwoInputs, input1: input1))
    }
    
    mutating func updateTerm(to decimal: CalculatorCell.Decimal? = nil, startingDigit: CalculatorCell.Digit = CalculatorCell.Digit.Zero, toggleSign: Bool = false) {
        self = Term.mutableOperand(MutableOperand(decimal: decimal, startingDigit: startingDigit, toggleSign: toggleSign))
    }
    
    mutating func updateTerm(to leftTermDouble: Double?, operatorType: CalculatorCell.Operator, rightTermDouble: Double?) {
        self = Term.operation(Operation(leftTermDouble: leftTermDouble, operatorType: operatorType, rightTermDouble: rightTermDouble))
    }
    
    mutating func updateTerm(to nestedArithmeticController: ArithmeticController) {
        self = Term.nestedArithmeticController(nestedArithmeticController)
    }
    
    mutating func updateTerm(to percentageFunctionTerm: PercentageFunction) {
        self = Term.percentageFunction(percentageFunctionTerm)
    }

    mutating func updateTerm(trigonometricFunction: CalculatorCell, input1: Term, siUnit: CalculatorCell.SIUnit) {
        self = Term.trigonometricFunction(TrigonometricFunction(functionName: trigonometricFunction, input1: input1, unit: siUnit))
    }
    
    mutating func updateTerm(to input1: Term) {
        self = input1
    }
    
    //MARK: - Computed Properties
    
    var doubleValue: Double? {
        switch self {
        case .constantOperand(let constant):
            return constant.doubleValue()
        case .fixedOperand(let fixedOperand):
            return fixedOperand.doubleValue()
        case .finalExpression(let term):
            return term.doubleValue
        case .functionWithOneInput(let function):
            return function.doubleValue()
        case .functionWithTwoInputs(let function):
            return function.doubleValue()
        case .memoryReserve(let memoryReserve):
            return memoryReserve.doubleValue()
        case .mutableOperand(let mutableOperand):
            return mutableOperand.doubleValue()
        case .operation(let operation):
            return operation.doubleValue()
        case .nestedArithmeticController(let arithmeticController):
            let solver: ShuntingYardsSolver = ShuntingYardsSolver()
            solver.updateProperties(with: arithmeticController.precedenceOperations, index: arithmeticController.parentheticalExpressionIndex)
            return solver.solve()
            return nil
        case .percentageFunction(let function):
            return function.doubleValue()
        case .precedenceOperationTotal(let leftTerm, let operator_, let rightTerm):
            return operator_.evaluate(leftTermDouble: leftTerm.doubleValue, rightTermDouble: rightTerm.doubleValue)
        case .ThisTermNeedsToBeSet:
            return nil
        case .trigonometricFunction(let function):
            return function.doubleValue()
        }
    }
    
    var numberValue: NSNumber? {
        switch self {
        case .constantOperand(let constant):
            guard let double: Double = constant.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .fixedOperand(let fixedOperand):
            guard let double: Double = fixedOperand.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .finalExpression(let term):
            guard let double: Double = term.doubleValue else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .functionWithOneInput(let function):
            guard let double: Double = function.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .functionWithTwoInputs(let function):
            guard let double: Double = function.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .memoryReserve(let memoryReserve):
            guard let double: Double = memoryReserve.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .mutableOperand(let mutableOperand):
            guard let double: Double = mutableOperand.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .operation(let operation):
            guard let double: Double = operation.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .percentageFunction(let function):
            guard let double: Double = function.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .precedenceOperationTotal(let leftTerm, let operator_, let rightTerm):
            guard let double = operator_.evaluate(leftTermDouble: leftTerm.doubleValue, rightTermDouble: rightTerm.doubleValue) else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        case .trigonometricFunction(let function):
            guard let double: Double = function.doubleValue() else { return nil }
            
            let number: NSNumber = NSNumber(value: double)
            return number
        default:
            return nil
        }
    }
}

class SignCanToggle {
    
    //MARK: - Properties
    
    var toggleSign: Bool
    
    //MARK: - Init
    
    init () {
        self.toggleSign = false
    }
}

protocol NumberValue {
    func numberDouble() -> NSNumber?
}

protocol DoubleValue {
    func doubleValue() -> Double?
}

protocol EvaluateFunction {
    func evaluateFunction() -> Double?
}
