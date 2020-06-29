//
//  PrecedenceOperation.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/22/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class PrecedenceOperation {
    
    //MARK: - Properties
    
    var leftTerm: Term
    var operator_: CalculatorCell.Operator?
    var rightTerm: Term
    
    //MARK: - Init
    
    init() {
        self.leftTerm = Term.ThisTermNeedsToBeSet
        self.rightTerm = Term.ThisTermNeedsToBeSet
    }
    
    //MARK: - Computed Properties Maybe turn into function
    
    var pointerToTermToUpdate: UnsafeMutablePointer<Term>! {
        return self.operator_ == nil ? UnsafeMutablePointer<Term>(&self.leftTerm) : UnsafeMutablePointer<Term>(&self.rightTerm)
    }
    
    var operationStarted: Bool {
        guard self.operator_ == nil else { return true }
        return self.leftTermIsSet || self.rightTermIsSet
    }
    
    var lastEntryWasOperator: Bool {
        guard self.operator_ != nil else { return false }
        switch self.rightTerm {
        case .ThisTermNeedsToBeSet:
            return true
        default:
            return false
        }
    }

    var leftTermIsSet: Bool {
        switch self.leftTerm {
        case .ThisTermNeedsToBeSet:
            return false
        default:
            return true
        }
    }
    
    var rightTermIsSet: Bool {
        switch self.rightTerm {
        case .ThisTermNeedsToBeSet:
            return false
        default:
            return true
        }
    }
    
    var rightTermHasANestedArithmeticController: Bool {
        switch self.rightTerm {
        case .functionWithTwoInputs(let function):
            switch function.input2 {
            case .nestedArithmeticController:
                return true
            default:
                break
            }
        default:
            break
        }
        return false
    }
    
    var leftTermHasANestedArithmeticController: Bool {
        switch self.leftTerm {
        case .functionWithTwoInputs(let function):
            switch function.input2 {
            case .nestedArithmeticController:
                return true
            default:
                break
            }
        default:
            break
        }
        return false
    }
    
    func updateOperation(with newOperator: CalculatorCell.Operator) {
        let precedenceOperationTotalLeftTerm = self.leftTerm
        let precedenceOperationTotalOperator = self.operator_
        let precedenceOperationTotalRightTerm = self.rightTerm
        let precedenceOperationTotalTerm = Term.precedenceOperationTotal(
            leftTerm: precedenceOperationTotalLeftTerm,
            operator_: precedenceOperationTotalOperator!,
            rightTerm: precedenceOperationTotalRightTerm
        )
        self.leftTerm = precedenceOperationTotalTerm
        self.operator_ = newOperator
        self.rightTerm = Term.ThisTermNeedsToBeSet
    }
    
    func addTerm(term: Term) {
        if !self.leftTermIsSet {
            self.leftTerm = term
        }
        else {
            self.rightTerm = term
        }
    }
}
