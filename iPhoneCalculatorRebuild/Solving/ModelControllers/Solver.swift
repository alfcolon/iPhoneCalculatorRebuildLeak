//
//  Solver.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/24/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation


class ShuntingYardsSolver {
    
    //MARK: - Properties
    
    var operators: [CalculatorCell.Operator]!
    var termDoubles: [Double]
    var terms: [Term]
    
    //MARK: - Init
    
    init() {
        self.operators = []
        
        self.terms = []
        
        self.termDoubles = []
    }
    
    //MARK: - Methods
    
    func updateProperties(with precedenceOperations: [Int: PrecedenceOperationController], index: Int) {
        for index in 0...index {
            let precedenceOperation: PrecedenceOperationController! = precedenceOperations[index]
            let low: PrecedenceOperation! = precedenceOperation.low
            let high: PrecedenceOperation! = precedenceOperation.high
            
            if low.leftTermIsSet {
                self.terms.append(low.leftTerm)
            }
            if let operator_ = low.operator_ {
                operators.append(operator_)
            }
            if low.rightTermIsSet {
                terms.append(low.rightTerm)
            }
            if high.leftTermIsSet {
                terms.append(high.rightTerm)
            }
            if let operator_ = high.operator_ {
                operators.append(operator_)
            }
            if high.rightTermIsSet {
                terms.append(high.rightTerm)
            }
        }
    }
    
    func reduceSingleTermInputsIfNeeded() {
        //Reduce inputs to fixedOperands for functions
        if terms.count == 1 {
            let term: Term! = self.terms[0]
            switch term {
            case .functionWithOneInput(var function):
                let input1Double: Double? = function.input1.doubleValue
                function.input1.updateTerm(to: input1Double)
            case .functionWithTwoInputs(var function):
                let input1Double: Double? = function.input1.doubleValue
                let input2Double: Double? = function.input2.doubleValue
                function.input1.updateTerm(to: input1Double)
                function.input2.updateTerm(to: input2Double)
            case .trigonometricFunction(var function):
                let input1Double: Double? = function.input1.doubleValue
                function.input1.updateTerm(to: input1Double)
            default:
                break
            }
        }
    }
    
    func solve() -> Double? {
        guard self.terms.count > 1 else { return self.terms[0].doubleValue }
        
        //Shunting Yards'ish solving sans the while true
        for _ in stride(from: operators.count - 1, through: 0, by: -1) {
            //Remove terms and operator
            guard let rightTermDouble: Double = terms.removeLast().doubleValue else { return nil }
            guard let leftTermDouble: Double = terms.removeLast().doubleValue else { return nil }
            let operator_: CalculatorCell.Operator = operators.removeLast()
            
            //Evaluation expression
            guard let total = operator_.evaluate(leftTermDouble: leftTermDouble, rightTermDouble: rightTermDouble) else { return nil }
            
            //Add evaluatedTotal to the terms
            termDoubles.append(total)
        }
        
        return termDoubles[0]
    }
}
