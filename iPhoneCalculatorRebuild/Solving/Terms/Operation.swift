//
//  Operation.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class Operation: SignCanToggle, DoubleValue {

    //MARK: - Properties

    var leftTermDouble: Double?
    var operatorType: CalculatorCell.Operator
    var rightTermDouble: Double?

    //MARK: - Init

    init(
        leftTermDouble: Double?,
        operatorType: CalculatorCell.Operator,
        rightTermDouble: Double?
    ) {
        self.leftTermDouble = leftTermDouble
        self.operatorType = operatorType
        self.rightTermDouble = rightTermDouble
    }

    //MARK: - Methods

    func doubleValue() -> Double? {
        guard leftTermDouble != nil else { return nil }
        guard rightTermDouble != nil else { return nil }

        let evaluatedTotal = operatorType.evaluate(leftTermDouble: leftTermDouble!, rightTermDouble: rightTermDouble!)
        if evaluatedTotal != nil {
            return self.toggleSign ? -evaluatedTotal! : evaluatedTotal!
        }
        return evaluatedTotal
    }
}
