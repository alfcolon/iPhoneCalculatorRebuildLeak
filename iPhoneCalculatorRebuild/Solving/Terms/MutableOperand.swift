//
//  MutableOperand.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/16/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import Foundation

class MutableOperand: SignCanToggle, DoubleValue {
    
    //MARK: - Properites
    
    var decimal: Bool
    var fractionArray: [String]
    var integerArray: [String]
    
    //MARK: - Init
    
    init(decimal: CalculatorCell.Decimal?, startingDigit: CalculatorCell.Digit, toggleSign: Bool) {
        
        self.decimal = decimal == nil ? false : true
        
        self.fractionArray = []
        
        self.integerArray = []
        self.integerArray.append(startingDigit.rawValue)
        
        super.init()
        
        self.toggleSign = toggleSign
    }
    
    //MARK: - Methods
    
    func addDecimal() {
        guard self.decimal == false else { return }
        
        self.decimal.toggle()
    }
    
    func addDigit(digit: CalculatorCell.Digit) {
        guard !self.decimal else { return self.fractionArray.append(digit.rawValue) }
        
        let digitCount: Int = self.fractionArray.count + self.integerArray.count
        
        switch Calculators.active {
        case .Scientific:
            guard digitCount < ScientificCalculator.numberFormatter.decimalDigitMaximum else { return }
        case .Standard:
            guard digitCount < StandardCalculator.numberFormatter.decimalDigitMaximum else { return }
        }
        
        if integerArray == ["0"] {
            integerArray[0] = digit.rawValue
        }
        else {
            self.integerArray.append(digit.rawValue)
        }
    }
    
    func doubleValue() -> Double? {
        let doubleArray: [String] = decimal ? integerArray + ["."] + fractionArray : integerArray
        let double: Double! = Double(doubleArray.joined())
        
        return self.toggleSign ? -double : double
    }
    
    func removeLastDigit() {
        
        switch true {
        case self.fractionArray.count > 0:
            self.fractionArray.removeLast()
        case self.decimal == true:
            self.decimal = false
        case self.integerArray.count > 1:
            self.integerArray.removeLast()
        default:
            self.integerArray[0] = "0"
        }
    }
}
