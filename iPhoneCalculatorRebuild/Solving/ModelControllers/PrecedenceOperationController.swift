//
//  PrecedenceOperation.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/20/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

enum CurrentPrecedence {
    case high
    case low
}

struct PrecedenceOperations {
    
    //MARK: - Properties
    
    var high: PrecedenceOperation
    var low: PrecedenceOperation
    
    //MARK: - Init
    
    init() {
        self.high = PrecedenceOperation()
        self.low = PrecedenceOperation()
    }
}

class PrecedenceOperationController {
    
    //MARK: - Properties
    
    var currentPrecedenceType: CurrentPrecedence!
    var currentPrecedenceOperation: PrecedenceOperation { get { return self.currentPrecedenceType! == .high ? self.high : self.low } }
    var high: PrecedenceOperation
    var low: PrecedenceOperation
    var precedenceOperationStarted: Bool { get { return self.high.operationStarted == false && self.low.operationStarted } }
    
    //MARK: - Init
    
    init(startingTerm: Term?) {
        self.currentPrecedenceType = .low
        
        self.high = PrecedenceOperation()
        
        self.low = PrecedenceOperation()
        
        if let startingTerm = startingTerm {
            self.low.leftTerm = startingTerm
        }
    }
    
    //MARK: - Methods
    
    func addTerm(term: Term) {
        switch self.currentPrecedenceType! {
        case .high:
            self.high.addTerm(term: term)
        case .low:
            self.low.addTerm(term: term)
        }
    }
    
    func getStartingTerm( ) -> Term? {
        switch self.currentPrecedenceType! {
        case .high:
            guard self.high.operationStarted else { return nil }
            guard self.high.lastEntryWasOperator == false else { return nil }
            
            if self.high.rightTermIsSet {
                let rightTerm: Term = self.high.rightTerm
                
                self.high.rightTerm = Term.ThisTermNeedsToBeSet
                
                return rightTerm
            }
            else {
                let leftTerm: Term = self.high.leftTerm
                
                self.high.leftTerm = Term.ThisTermNeedsToBeSet
                
                return leftTerm
            }
        case .low:
            guard self.low.operationStarted else { return nil }
            guard self.low.lastEntryWasOperator == false else { return nil }
            
            if self.low.rightTermIsSet {
                let rightTerm: Term = self.low.rightTerm
                
                self.low.rightTerm = Term.ThisTermNeedsToBeSet
                
                return rightTerm
            }
            else {
                let leftTerm: Term = self.low.leftTerm
                
                self.low.leftTerm = Term.ThisTermNeedsToBeSet
                
                return leftTerm
            }
        }
    }
    
    //MARK: - New Operator Methods
    
    func demotePrecedence(for newOperator: CalculatorCell.Operator) {
        var leftTerm: Term!
        
        if self.low.operationStarted {
            if self.high.rightTermIsSet {
                leftTerm = Term.precedenceOperationTotal(
                    leftTerm: self.low.leftTerm,
                    operator_: self.low.operator_!,
                    rightTerm: {
                        let leftTermDouble: Double? = self.high.leftTerm.doubleValue
                        let rightTermDouble: Double? = self.high.rightTerm.doubleValue
                        let evaluatedDouble = self.high.operator_!.evaluate(
                            leftTermDouble: leftTermDouble,
                            rightTermDouble: rightTermDouble
                        )
                        return Term(double: evaluatedDouble)
                    }()
                )
            }
            else {
                leftTerm = Term.precedenceOperationTotal(
                    leftTerm: self.low.leftTerm,
                    operator_: self.low.operator_!,
                    rightTerm: self.high.leftTerm
                )
            }
        }
        else {
            if self.high.rightTermIsSet {
                leftTerm = Term.precedenceOperationTotal(
                    leftTerm: self.high.leftTerm,
                    operator_: self.high.operator_!,
                    rightTerm: self.high.rightTerm
                )
            }
            else {
                leftTerm = self.high.leftTerm
            }
        }
        
        self.low.leftTerm = leftTerm
        self.low.operator_ = newOperator
        self.high = PrecedenceOperation()
    }
    
    func promotePrecedence(for newOperator: CalculatorCell.Operator) {
        var leftTerm: Term!
        
        if self.low.rightTermIsSet {
            leftTerm = self.low.rightTerm
            self.low.rightTerm = Term.ThisTermNeedsToBeSet
        }
        else {
            switch self.low.leftTerm {
            case .precedenceOperationTotal(let leftTerm_, let operator_, let rightTerm):
                self.low.leftTerm = leftTerm_
                self.low.operator_ = operator_
                leftTerm = rightTerm
            default:
                leftTerm = self.low.leftTerm
                self.low = PrecedenceOperation()
            }
            
        }
        
        self.high.leftTerm = leftTerm
        self.high.operator_ = newOperator
    }
    
    func update(for newOperator: CalculatorCell.Operator) {
        guard !self.high.rightTermHasANestedArithmeticController else { return }
        guard !self.high.leftTermHasANestedArithmeticController else { return }
        
        switch self.currentPrecedenceType! {
        case .high:
            if newOperator.precedence == 1 {
                if self.high.rightTermIsSet {
                    self.high.updateOperation(with: newOperator)
                }
                else {
                    self.high.operator_ = newOperator
                }
            }
            else {
                self.demotePrecedence(for: newOperator)
                self.currentPrecedenceType = .low
            }
        case .low:
            if newOperator.precedence == 0 {
                if self.low.rightTermIsSet {
                    self.low.updateOperation(with: newOperator)
                }
                else {
                    self.low.operator_ = newOperator
                }
            }
            else {
                self.promotePrecedence(for: newOperator)
                self.currentPrecedenceType = .high
            }
        }
    }
    
    //MARK: - Updating Location Methods

    func removeCurrentPrecedenceOperation() -> PrecedenceOperation {
        var precedenceOperation: PrecedenceOperation!
        
        switch self.currentPrecedenceType! {
        case .high:
            precedenceOperation = self.high
            self.high = PrecedenceOperation()
            self.currentPrecedenceType = .low
        case .low:
            precedenceOperation = self.low
            self.low = PrecedenceOperation()
            self.currentPrecedenceType = .high
        }
        
        return precedenceOperation
    }
    
    func replaceCurrentPrecedenceOperation(with precedenceOperation: PrecedenceOperation) {
        switch self.currentPrecedenceType! {
        case .high:
            self.high = precedenceOperation
        case .low:
            self.low = precedenceOperation
        }
    }
}
