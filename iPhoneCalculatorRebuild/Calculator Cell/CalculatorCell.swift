//
//  CalculatorCell.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

protocol CellAppearence {
    var appearenceChangesWhenSelected: Bool { get }
    var backgroundColor: UIColor { get }
    var highlightColor: UIColor { get }
    var selectedBackgroundColor: UIColor? { get }
    var selectedTextColor: UIColor? { get }
    var textColor: UIColor { get }
}

protocol ToggledValue {
    var toggledValue: CalculatorCell? { get }
}

protocol AttributedString {
    var attributedString: NSAttributedString { get }
}

enum CalculatorCell: AttributedString, CellAppearence, ToggledValue {
    case clear(Clear)
    case constant(Constant)
    case decimal(Decimal)
    case digit(Digit)
    case equal(Equal)
    case exponentFunction(ExponentFunction)
    case factorial(Factorial)
    case logFunction(LogFunction)
    case memoryRecall(MemoryRecall)
    case operator_(Operator)
    case parentheses(Parentheses)
    case percentageFunction(PercentageFunction)
    case reciprocal(Reciprocal)
    case rootFunction(RootFunction)
    case siUnit(SIUnit)
    case toggleNumberSign(ToggleNumberSign)
    case toggleSecondSetOfFunctions(ToggleSecondSetOfFunctions)
    case trigonometricHyperbolicFunction(TrigonometricFunctions.Hyperbolic)
    case trigonometricInverseHyperbolicFunction(TrigonometricFunctions.InverseHyperbolic)
    case trigonometricInverseRightAngleFunction(TrigonometricFunctions.InverseRightAngle)
    case trigonometricRightAngleFunction(TrigonometricFunctions.RightAngle)
    
    var appearenceChangesWhenSelected: Bool {
        switch self {
        case .clear(let clearType):
            return clearType.appearenceChangesWhenSelected
        case .constant(let constantType):
            return constantType.appearenceChangesWhenSelected
        case .decimal(let decimal):
            return decimal.appearenceChangesWhenSelected
        case .digit(let digitType):
            return digitType.appearenceChangesWhenSelected
        case .equal(let equal):
            return equal.appearenceChangesWhenSelected
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.appearenceChangesWhenSelected
        case .factorial(let factorial):
            return factorial.appearenceChangesWhenSelected
        case .logFunction(let logFunctionType):
            return logFunctionType.appearenceChangesWhenSelected
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.appearenceChangesWhenSelected
        case .operator_(let operatorType):
            return operatorType.appearenceChangesWhenSelected
        case .parentheses(let parenthesis):
            return parenthesis.appearenceChangesWhenSelected
        case .percentageFunction(let percentageFunction):
            return percentageFunction.appearenceChangesWhenSelected
        case .reciprocal(let reciprocal):
            return reciprocal.appearenceChangesWhenSelected
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.appearenceChangesWhenSelected
        case .siUnit(let siUnitType):
            return siUnitType.appearenceChangesWhenSelected
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.appearenceChangesWhenSelected
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.appearenceChangesWhenSelected
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.appearenceChangesWhenSelected
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.appearenceChangesWhenSelected
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.appearenceChangesWhenSelected
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.appearenceChangesWhenSelected
        }
    }
    
    var attributedString: NSAttributedString {
        switch self {
        case .clear(let clearType):
            return clearType.attributedString
        case .constant(let constantType):
            return constantType.attributedString
        case .decimal(let decimal):
            return decimal.attributedString
        case .digit(let digitType):
            return digitType.attributedString
        case .equal(let equal):
            return equal.attributedString
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.attributedString
        case .factorial(let factorial):
            return factorial.attributedString
        case .logFunction(let logFunctionType):
            return logFunctionType.attributedString
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.attributedString
        case .operator_(let operatorType):
            return operatorType.attributedString
        case .parentheses(let parenthesis):
            return parenthesis.attributedString
        case .percentageFunction(let percentageFunction):
            return percentageFunction.attributedString
        case .reciprocal(let reciprocal):
            return reciprocal.attributedString
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.attributedString
        case .siUnit(let siUnitType):
            return siUnitType.attributedString
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.attributedString
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.attributedString
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.attributedString
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.attributedString
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.attributedString
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.attributedString
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .clear(let clearType):
            return clearType.colorTheme.backgroundColor
        case .constant(let constantType):
            return constantType.colorTheme.backgroundColor
        case .decimal(let decimal):
            return decimal.colorTheme.backgroundColor
        case .digit(let digitType):
            return digitType.colorTheme.backgroundColor
        case .equal(let equal):
            return equal.colorTheme.backgroundColor
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.colorTheme.backgroundColor
        case .factorial(let factorial):
            return factorial.colorTheme.backgroundColor
        case .logFunction(let logFunctionType):
            return logFunctionType.colorTheme.backgroundColor
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.colorTheme.backgroundColor
        case .operator_(let operatorType):
            return operatorType.colorTheme.backgroundColor
        case .parentheses(let parenthesis):
            return parenthesis.colorTheme.backgroundColor
        case .percentageFunction(let percentageFunction):
            return percentageFunction.colorTheme.backgroundColor
        case .reciprocal(let reciprocal):
            return reciprocal.colorTheme.backgroundColor
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.colorTheme.backgroundColor
        case .siUnit(let siUnitType):
            return siUnitType.colorTheme.backgroundColor
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.colorTheme.backgroundColor
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.colorTheme.backgroundColor
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.colorTheme.backgroundColor
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.colorTheme.backgroundColor
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.colorTheme.backgroundColor
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.colorTheme.backgroundColor
        }
    }

    var highlightColor: UIColor {
        switch self {
        case .clear(let clearType):
            return clearType.colorTheme.highlightColor
        case .constant(let constantType):
            return constantType.colorTheme.highlightColor
        case .decimal(let decimal):
            return decimal.colorTheme.highlightColor
        case .digit(let digitType):
            return digitType.colorTheme.highlightColor
        case .equal(let equal):
            return equal.colorTheme.highlightColor
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.colorTheme.highlightColor
        case .factorial(let factorial):
            return factorial.colorTheme.highlightColor
        case .logFunction(let logFunctionType):
            return logFunctionType.colorTheme.highlightColor
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.colorTheme.highlightColor
        case .operator_(let operatorType):
            return operatorType.colorTheme.highlightColor
        case .parentheses(let parenthesis):
            return parenthesis.colorTheme.highlightColor
        case .percentageFunction(let percentageFunction):
            return percentageFunction.colorTheme.highlightColor
        case .reciprocal(let reciprocal):
            return reciprocal.colorTheme.highlightColor
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.colorTheme.highlightColor
        case .siUnit(let siUnitType):
            return siUnitType.colorTheme.highlightColor
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.colorTheme.highlightColor
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.colorTheme.highlightColor
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.colorTheme.highlightColor
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.colorTheme.highlightColor
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.colorTheme.highlightColor
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.colorTheme.highlightColor
        }
    }

    var selectedBackgroundColor: UIColor? {
        switch self {
        case .clear(let clearType):
            return clearType.colorTheme.selectedBackgroundColor
        case .constant(let constantType):
            return constantType.colorTheme.selectedBackgroundColor
        case .decimal(let decimal):
            return decimal.colorTheme.selectedBackgroundColor
        case .digit(let digitType):
            return digitType.colorTheme.selectedBackgroundColor
        case .equal(let equal):
            return equal.colorTheme.selectedBackgroundColor
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.colorTheme.selectedBackgroundColor
        case .factorial(let factorial):
            return factorial.colorTheme.selectedBackgroundColor
        case .logFunction(let logFunctionType):
            return logFunctionType.colorTheme.selectedBackgroundColor
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.colorTheme.selectedBackgroundColor
        case .operator_(let operatorType):
            return operatorType.colorTheme.selectedBackgroundColor
        case .parentheses(let parenthesis):
            return parenthesis.colorTheme.selectedBackgroundColor
        case .percentageFunction(let percentageFunction):
            return percentageFunction.colorTheme.selectedBackgroundColor
        case .reciprocal(let reciprocal):
            return reciprocal.colorTheme.selectedBackgroundColor
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.colorTheme.selectedBackgroundColor
        case .siUnit(let siUnitType):
            return siUnitType.colorTheme.selectedBackgroundColor
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.colorTheme.selectedBackgroundColor
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.colorTheme.selectedBackgroundColor
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.colorTheme.selectedBackgroundColor
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.colorTheme.selectedBackgroundColor
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.colorTheme.selectedBackgroundColor
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.colorTheme.selectedBackgroundColor
        }
    }

    var selectedTextColor: UIColor? {
        switch self {
        case .clear(let clearType):
            return clearType.colorTheme.selectedTextColor
        case .constant(let constantType):
            return constantType.colorTheme.selectedTextColor
        case .decimal(let decimal):
            return decimal.colorTheme.selectedTextColor
        case .digit(let digitType):
            return digitType.colorTheme.selectedTextColor
        case .equal(let equal):
            return equal.colorTheme.selectedTextColor
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.colorTheme.selectedTextColor
        case .factorial(let factorial):
            return factorial.colorTheme.selectedTextColor
        case .logFunction(let logFunctionType):
            return logFunctionType.colorTheme.selectedTextColor
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.colorTheme.selectedTextColor
        case .operator_(let operatorType):
            return operatorType.colorTheme.selectedTextColor
        case .parentheses(let parenthesis):
            return parenthesis.colorTheme.selectedTextColor
        case .percentageFunction(let percentageFunction):
            return percentageFunction.colorTheme.selectedTextColor
        case .reciprocal(let reciprocal):
            return reciprocal.colorTheme.selectedTextColor
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.colorTheme.selectedTextColor
        case .siUnit(let siUnitType):
            return siUnitType.colorTheme.selectedTextColor
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.colorTheme.selectedTextColor
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.colorTheme.selectedTextColor
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.colorTheme.selectedTextColor
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.colorTheme.selectedTextColor
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.colorTheme.selectedTextColor
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.colorTheme.selectedTextColor
        }
    }

    var textColor: UIColor {
        switch self {
        case .clear(let clearType):
            return clearType.colorTheme.textColor
        case .constant(let constantType):
            return constantType.colorTheme.textColor
        case .decimal(let decimal):
            return decimal.colorTheme.textColor
        case .digit(let digitType):
            return digitType.colorTheme.textColor
        case .equal(let equal):
            return equal.colorTheme.textColor
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.colorTheme.textColor
        case .factorial(let factorial):
            return factorial.colorTheme.textColor
        case .logFunction(let logFunctionType):
            return logFunctionType.colorTheme.textColor
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.colorTheme.textColor
        case .operator_(let operatorType):
            return operatorType.colorTheme.textColor
        case .parentheses(let parenthesis):
            return parenthesis.colorTheme.textColor
        case .percentageFunction(let percentageFunction):
            return percentageFunction.colorTheme.textColor
        case .reciprocal(let reciprocal):
            return reciprocal.colorTheme.textColor
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.colorTheme.textColor
        case .siUnit(let siUnitType):
            return siUnitType.colorTheme.textColor
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.colorTheme.textColor
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.colorTheme.textColor
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.colorTheme.textColor
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.colorTheme.textColor
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.colorTheme.textColor
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.colorTheme.textColor
        }
    }
    
    var toggledValue: CalculatorCell? {
        switch self {
        case .clear(let clearType):
            return clearType.toggledValue
        case .constant(let constantType):
            return constantType.toggledValue
        case .decimal(let decimal):
            return decimal.toggledValue
        case .digit(let digitType):
            return digitType.toggledValue
        case .equal(let equal):
            return equal.toggledValue
        case .exponentFunction(let exponentFunctionType):
            return exponentFunctionType.toggledValue
        case .factorial(let factorial):
            return factorial.toggledValue
        case .logFunction(let logFunctionType):
            return logFunctionType.toggledValue
        case .memoryRecall(let memoryRecallType):
            return memoryRecallType.toggledValue
        case .operator_(let operatorType):
            return operatorType.toggledValue
        case .parentheses(let parenthesis):
            return parenthesis.toggledValue
        case .percentageFunction(let percentageFunction):
            return percentageFunction.toggledValue
        case .reciprocal(let reciprocal):
            return reciprocal.toggledValue
        case .rootFunction(let rootFunctionType):
            return rootFunctionType.toggledValue
        case .siUnit(let siUnitType):
            return siUnitType.toggledValue
        case .toggleNumberSign(let toggleNumberSign):
            return toggleNumberSign.toggledValue
        case .toggleSecondSetOfFunctions(let toggleSecondSetOfFunctions):
            return toggleSecondSetOfFunctions.toggledValue
        case .trigonometricHyperbolicFunction(let hyperbolicType):
            return hyperbolicType.toggledValue
        case .trigonometricInverseHyperbolicFunction(let inverseHyperbolicType):
            return inverseHyperbolicType.toggledValue
        case .trigonometricInverseRightAngleFunction(let inverseRightAngle):
            return inverseRightAngle.toggledValue
        case .trigonometricRightAngleFunction(let rightAngle):
            return rightAngle.toggledValue
        }
    }
    
    var isFunctionWithTwoInputs: Bool {
        switch self {
        case .exponentFunction(let function):
            switch function {
            case .BaseXPowerY,
                 .BaseYPowerX,
                 .EnterExponent:
                return true
            default:
                return false
            }
        case .logFunction(let function):
            switch function {
            case .LogBaseY:
                return true
            default:
                return false
            }
        default:
            return false
        }
    }
    
    //MARK: - CalculatorCell Types
    
    //MARK: - Clear

    enum Clear: String, AttributedString, ToggledValue {
        case AllClear = "AC"
        case ClearEntry = "C"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.ClearType(self.rawValue).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.ClearType(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.LightGrayish }
        
        //MARK: - Toggled Value
        
        var toggledValue: CalculatorCell? {
            switch self {
            case .AllClear:
                return CalculatorCell.clear(CalculatorCell.Clear.ClearEntry)
            case .ClearEntry:
                return CalculatorCell.clear(CalculatorCell.Clear.AllClear)
            }
        }
        
        //MARK: - Toggles Cell Value
        
        func togglesCellValue(for calculatorCell: CalculatorCell) -> Bool {
            switch self {
            case .AllClear:
                switch calculatorCell {
                case .constant,
                     .decimal,
                     .digit:
                    return true
                default:
                    break
                }
            case .ClearEntry:
                switch calculatorCell {
                case .clear:
                    return true
                default:
                    break
                }
            }
            return false
        }
    }

    //MARK: - Constant

    enum Constant: String, AttributedString, ToggledValue {
        case EulersNumber = "e"
        case Pi = "π"
        case RandomNumber = "Rand"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.Constant(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var colorTheme: Colors { return Colors.EerieBlackish }
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        //MARK: - Toggled Value
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - Decimal

    enum Decimal: String, AttributedString, ToggledValue {
        case Decimal = "."
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.Decimal(self.rawValue).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.Decimal(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.DarkLiverish }
        
        var selectedBackgroundColor: UIColor? { return nil }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - Digit

    enum Digit: String, AttributedString, ToggledValue {
        case Eight = "8"
        case Five = "5"
        case Four = "4"
        case Nine = "9"
        case One = "1"
        case Seven = "7"
        case Six = "6"
        case Three = "3"
        case Two = "2"
        case Zero = "0"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.Digit(self.rawValue).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.Digit(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.DarkLiverish }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - Equal

    enum Equal: String, AttributedString, ToggledValue {
        case Equal = "="
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.Equal(self.rawValue).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.Equal(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.VividGambogeish }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - ExponentFunction

    enum ExponentFunction: String, AttributedString, ToggledValue {
        case BaseEulersNumberPowerX = "ex"
        case BaseTenPowerX = "10x"
        case BaseTwoPowerX = "2x"
        case BaseXPowerThree = "x3"
        case BaseXPowerTwo = "x2"
        case BaseXPowerY = "xy"
        case BaseYPowerX = "yx"
        case EnterExponent = "EE"
        
        enum FunctionWithOneInput: String {
            case BaseEulersNumberPowerX = "ex"
            case BaseTenPowerX = "10x"
            case BaseTwoPowerX = "2x"
            case BaseXPowerThree = "x3"
            case BaseXPowerTwo = "x2"
        }
        
        enum FunctionWithTwoInputs: String {
            case BaseXPowerY = "xy"
            case BaseYPowerX = "yx"
            case EnterExponent = "EE"
        }
        
        //MARK: - Attributed String
       
        var attributedString: NSAttributedString {
            switch self {
            case .BaseEulersNumberPowerX:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("e"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("x")).formattedAttributedString
            case .BaseTenPowerX:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("10"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("x")).formattedAttributedString
            case .BaseTwoPowerX:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("2"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("x")).formattedAttributedString
            case .BaseXPowerThree:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("x"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("3")).formattedAttributedString
            case .BaseXPowerTwo:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("x"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("2")).formattedAttributedString
            case .BaseXPowerY:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("x"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("y")).formattedAttributedString
            case .BaseYPowerX:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunction(
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("y"),
                    ScientificCalculator.AttributedStringFormatter.ExponentFunctionExponent("x")).formattedAttributedString
            case .EnterExponent:
                return ScientificCalculator.AttributedStringFormatter.ExponentFunctionBase("EE").formattedAttributedString
            }
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool {
            switch self {
            case .BaseYPowerX,
                 .BaseXPowerY,
                 .EnterExponent:
                return true
            default:
                return false
            }
        }
        
        var colorTheme: Colors { return Colors.EerieBlackish }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? {
            switch self {
            case .BaseEulersNumberPowerX:
                return CalculatorCell.exponentFunction(CalculatorCell.ExponentFunction.BaseYPowerX)
            case .BaseTenPowerX:
                return CalculatorCell.exponentFunction(CalculatorCell.ExponentFunction.BaseTwoPowerX)
            case .BaseTwoPowerX:
                return CalculatorCell.exponentFunction(CalculatorCell.ExponentFunction.BaseTenPowerX)
            case .BaseYPowerX:
                return CalculatorCell.exponentFunction(CalculatorCell.ExponentFunction.BaseEulersNumberPowerX)
            default:
                return nil
            }
        }
    }

    //MARK: - Factorial

    enum Factorial: String, AttributedString, ToggledValue {
        case Factorial = "x!"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.Factorial(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.EerieBlackish }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - LogFunction

    enum LogFunction: String, AttributedString, ToggledValue {
        case LogBaseTen = "log10"
        case LogBaseTwo = "log2"
        case LogBaseY = "logy"
        case NaturalLog = "ln"
         
        //MARK: - Attributed String

        var attributedString: NSAttributedString {
            switch self {
            case .LogBaseTen:
                return ScientificCalculator.AttributedStringFormatter.LogFunction(
                    ScientificCalculator.AttributedStringFormatter.LogFunctionText("log"),
                    ScientificCalculator.AttributedStringFormatter.LogFunctionBase("10")).formattedAttributedString
            case .LogBaseTwo:
                return ScientificCalculator.AttributedStringFormatter.LogFunction(
                    ScientificCalculator.AttributedStringFormatter.LogFunctionText("log"),
                    ScientificCalculator.AttributedStringFormatter.LogFunctionBase("2")).formattedAttributedString
            case .LogBaseY:
                return ScientificCalculator.AttributedStringFormatter.LogFunction(
                    ScientificCalculator.AttributedStringFormatter.LogFunctionText("log"),
                    ScientificCalculator.AttributedStringFormatter.LogFunctionBase("y")).formattedAttributedString
            case .NaturalLog:
                return ScientificCalculator.AttributedStringFormatter.LogFunctionText("ln").formattedAttributedString
            }
        }
         
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return self == .LogBaseY }
        
        var colorTheme: Colors { return Colors.EerieBlackish }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? {
            switch self {
            case .NaturalLog:
                return CalculatorCell.logFunction(CalculatorCell.LogFunction.LogBaseY)
            case .LogBaseTen:
                return CalculatorCell.logFunction(CalculatorCell.LogFunction.LogBaseTwo)
            case .LogBaseTwo:
                return CalculatorCell.logFunction(CalculatorCell.LogFunction.LogBaseTen)
            case .LogBaseY:
                return CalculatorCell.logFunction(CalculatorCell.LogFunction.NaturalLog)
            }
        }
    }

    //MARK: - MemoryRecall

    enum MemoryRecall: String, AttributedString, ToggledValue {
        case MemoryClear = "mc"
        case MemoryMinus = "m-"
        case MemoryPlus = "m+"
        case MemoryRecall = "mr"
         
        //MARK: - Attributed String

        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.MemoryRecall(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.EerieBlackish }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - Operator

    enum Operator: String, AttributedString, ToggledValue {
        case Addition = "+"
        case Division = "÷"
        case Multiplication = "×"
        case Subtraction = "−"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.Operator(self.rawValue).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.Operator(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Evaluate
        
        func evaluate(leftTermDouble: Double?, rightTermDouble: Double?) -> Double? {
            guard let leftTermDouble = leftTermDouble else { return nil }
            guard let rightTermDouble = rightTermDouble else { return nil }
            
            switch self {
            case .Addition:
                return leftTermDouble + rightTermDouble
            case .Division:
                return leftTermDouble / rightTermDouble
            case .Multiplication:
                return leftTermDouble * rightTermDouble
            case .Subtraction:
                return leftTermDouble - rightTermDouble
            }
        }
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return true }
        
        var colorTheme: Colors { return Colors.VividGambogeish }
        
        //MARK: - Precedence
        
        var precedence: Int {
            switch self {
            case .Addition,
                 .Subtraction:
                return 0
            case .Division,
                 .Multiplication:
                return 1
            }
        }
        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - ExponentFunction

    enum Parentheses: String, AttributedString, ToggledValue {
        case ClosingParenthesis = ")"
        case OpeningParenthesis = "("
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.Parenthesis(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.EerieBlackish }

        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - PercentageFunction

    enum PercentageFunction: String, AttributedString, ToggledValue {
        case PercentageFunction = "%"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.PercentageFunction(self.rawValue).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.PercentageFunction(self.rawValue).formattedAttributedString
        }

        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.LightGrayish }
       
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - Reciprocal

    enum Reciprocal: String, AttributedString, ToggledValue {
        case Reciprocal = "¹⁄x"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.ReciprocalFunction(
                ScientificCalculator.AttributedStringFormatter.ReciprocalNumerator("¹"),
                ScientificCalculator.AttributedStringFormatter.ReciprocalSolidus("⁄"),
                ScientificCalculator.AttributedStringFormatter.ReciprocalDenominator("x")).formattedAttributedString
        }

        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.EerieBlackish }

        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - RootFunction

    enum RootFunction: String, AttributedString, ToggledValue {
        case CoefficientThreeRadicandX = "³√⎺x"
        case CoefficientTwoRadicandX = "²√⎺x"
        case CoefficientYRadicandX = "ʸ√⎺x"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            switch self {
            case .CoefficientThreeRadicandX:
                return ScientificCalculator.AttributedStringFormatter.RootFunction(
                    ScientificCalculator.AttributedStringFormatter.RootFunctionCoefficient("3"),
                    ScientificCalculator.AttributedStringFormatter.RootFunctionRadicand("x")).formattedAttributedString
            case .CoefficientTwoRadicandX:
                return ScientificCalculator.AttributedStringFormatter.RootFunction(
                    ScientificCalculator.AttributedStringFormatter.RootFunctionCoefficient("2"),
                    ScientificCalculator.AttributedStringFormatter.RootFunctionRadicand("x")).formattedAttributedString
            case .CoefficientYRadicandX:
                return ScientificCalculator.AttributedStringFormatter.RootFunction(
                    ScientificCalculator.AttributedStringFormatter.RootFunctionCoefficient("ʸ"),
                    ScientificCalculator.AttributedStringFormatter.RootFunctionRadicandY("x")).formattedAttributedString
            }
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return self == .CoefficientYRadicandX }
        
        var colorTheme: Colors { return Colors.EerieBlackish }

        
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - SIUnit

    enum SIUnit: String, AttributedString, ToggledValue {
        case Degrees = "Deg"
        case Radians = "Rad"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.SIUnit(self.rawValue).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.EerieBlackish }
        
        //MARK: - SIUnitLabel Text
        
        var siUnitLabelText: String {
            switch self {
            case .Degrees:
                return "Rad"
            case .Radians:
                return ""
            }
        }
        //MARK: - Toggled Value
        
        var toggledValue: CalculatorCell? {
            switch self {
            case .Degrees:
                return CalculatorCell.siUnit(CalculatorCell.SIUnit.Radians)
            case .Radians:
                return CalculatorCell.siUnit(CalculatorCell.SIUnit.Degrees)
                
            }
        }
    }

    //MARK: - ToggleNumberSign

    enum ToggleNumberSign: String, AttributedString, ToggledValue {
        case ToggleNumberSign = "⁺⁄₋"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return Calculators.active == .Scientific ?
            ScientificCalculator.AttributedStringFormatter.ToggleNumberSign(
                ScientificCalculator.AttributedStringFormatter.ToggleNumberSignPlus("⁺"),
                ScientificCalculator.AttributedStringFormatter.ToggleNumberSignSolidus("⁄"),
                ScientificCalculator.AttributedStringFormatter.ToggleNumberSignMinus("₋")).formattedAttributedString
            :
            StandardCalculator.AttributedStringFormatter.ToggleNumberSign(
                StandardCalculator.AttributedStringFormatter.ToggleNumberSignPlus("⁺"),
                StandardCalculator.AttributedStringFormatter.ToggleNumberSignSolidus("⁄"),
                StandardCalculator.AttributedStringFormatter.ToggleNumberSignMinus("₋")).formattedAttributedString

        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return false }
        
        var colorTheme: Colors { return Colors.LightGrayish }

        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - ToggleSecondSetOfFunctions

    enum ToggleSecondSetOfFunctions: String, AttributedString, ToggledValue {
        case ToggleSecondSetOfFunctions = "2nd"
        
        //MARK: - Attributed String
        
        var attributedString: NSAttributedString {
            return ScientificCalculator.AttributedStringFormatter.ToggleSecondSetOfFunctions(
                ScientificCalculator.AttributedStringFormatter.ToggleSecondSetOfFunctionsText("2"),
                ScientificCalculator.AttributedStringFormatter.ToggleSecondSetOfFunctionsSuperscript("nd")).formattedAttributedString
        }
        
        //MARK: - Cell Appearence
        
        var appearenceChangesWhenSelected: Bool { return true }
        
        var colorTheme: Colors { return Colors.EerieBlackish }
      
        //MARK: - ToggledValue
        
        var toggledValue: CalculatorCell? { return nil }
    }

    //MARK: - TrigonometricFunctions

    enum TrigonometricFunctions {
        enum Hyperbolic: String, AttributedString , ToggledValue{
            case Cosine = "cosh"
            case Sine = "sinh"
            case Tangent = "tanh"
            
            //MARK: - Attributed String
            
            var attributedString: NSAttributedString {
                return ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText(self.rawValue).formattedAttributedString
            }
            
            //MARK: - Cell Appearence
            
            var appearenceChangesWhenSelected: Bool { return false }
            
            var colorTheme: Colors { return Colors.EerieBlackish }
            
            //MARK: - Toggled Value
            
            var toggledValue: CalculatorCell? {
                switch self {
                case .Cosine:
                    return CalculatorCell.trigonometricInverseHyperbolicFunction(TrigonometricFunctions.InverseHyperbolic.Cosine)
                case .Sine:
                    return CalculatorCell.trigonometricInverseHyperbolicFunction(TrigonometricFunctions.InverseHyperbolic.Sine)
                case .Tangent:
                    return CalculatorCell.trigonometricInverseHyperbolicFunction(TrigonometricFunctions.InverseHyperbolic.Tangent)
                    
                }
            }
        }
        
        enum InverseHyperbolic: String, AttributedString, ToggledValue {
            case Cosine = "cosh-1"
            case Sine = "sinh-1"
            case Tangent = "tanh-1"
            
            //MARK: - Attributed String
            
            var attributedString: NSAttributedString {
                switch self {
                case .Cosine:
                    return ScientificCalculator.AttributedStringFormatter.TrigonometricFunction(
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText("cosh"),
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionInverseExponent("-1")).formattedAttributedString
                case .Sine:
                    return ScientificCalculator.AttributedStringFormatter.TrigonometricFunction(
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText("sinh"),
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionInverseExponent("-1")).formattedAttributedString
                case .Tangent:
                    return ScientificCalculator.AttributedStringFormatter.TrigonometricFunction(
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText("tanh"),
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionInverseExponent("-1")).formattedAttributedString
                }
            }
            
            //MARK: - Cell Appearence
            
            var appearenceChangesWhenSelected: Bool { return false }
            
            var colorTheme: Colors { return Colors.EerieBlackish }
            
            //MARK: - Toggled Value
            

            var toggledValue: CalculatorCell? {
                switch self {
                case .Cosine:
                    return CalculatorCell.trigonometricHyperbolicFunction(TrigonometricFunctions.Hyperbolic.Cosine)
                case .Sine:
                    return CalculatorCell.trigonometricHyperbolicFunction(TrigonometricFunctions.Hyperbolic.Sine)
                case .Tangent:
                    return CalculatorCell.trigonometricHyperbolicFunction(TrigonometricFunctions.Hyperbolic.Tangent)
                }
            }
        }
        
        enum InverseRightAngle: String, AttributedString, ToggledValue {
            case Cosine = "cos-1"
            case Sine = "sin-1"
            case Tangent = "tan-1"
            
            //MARK: - Attributed String
            
            var attributedString: NSAttributedString {
                switch self {
                case .Cosine:
                    return ScientificCalculator.AttributedStringFormatter.TrigonometricFunction(
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText("cos"),
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionInverseExponent("-1")).formattedAttributedString
                case .Sine:
                    return ScientificCalculator.AttributedStringFormatter.TrigonometricFunction(
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText("sin"),
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionInverseExponent("-1")).formattedAttributedString
                case .Tangent:
                    return ScientificCalculator.AttributedStringFormatter.TrigonometricFunction(
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText("tan"),
                        ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionInverseExponent("-1")).formattedAttributedString
                }
            }
            
            //MARK: - Cell Appearence
            
            var appearenceChangesWhenSelected: Bool { return false }
            
            var colorTheme: Colors { return Colors.EerieBlackish }
            
            //MARK: - Toggled Value
            

            var toggledValue: CalculatorCell? {
                switch self {
                case .Cosine:
                    return CalculatorCell.trigonometricRightAngleFunction(TrigonometricFunctions.RightAngle.Cosine)
                case .Sine:
                    return CalculatorCell.trigonometricRightAngleFunction(TrigonometricFunctions.RightAngle.Sine)
                case .Tangent:
                    return CalculatorCell.trigonometricRightAngleFunction(TrigonometricFunctions.RightAngle.Tangent)
                }
            }
            
        }
        
        enum RightAngle: String, AttributedString, ToggledValue {
            case Cosine = "cos"
            case Sine = "sin"
            case Tangent = "tan"
            
            //MARK: - Attributed String
            
            var attributedString: NSAttributedString {
                return ScientificCalculator.AttributedStringFormatter.TrigonometricFunctionText(self.rawValue).formattedAttributedString
            }
            
            //MARK: - Cell Appearence
            
            var appearenceChangesWhenSelected: Bool { return false }
            
            var colorTheme: Colors { return Colors.EerieBlackish }
            
            //MARK: - Toggled Value
            
            var toggledValue: CalculatorCell? {
                switch self {
                case .Cosine:
                    return CalculatorCell.trigonometricInverseRightAngleFunction(TrigonometricFunctions.InverseRightAngle.Cosine)
                case .Sine:
                    return CalculatorCell.trigonometricInverseRightAngleFunction(TrigonometricFunctions.InverseRightAngle.Sine)
                case .Tangent:
                    return CalculatorCell.trigonometricInverseRightAngleFunction(TrigonometricFunctions.InverseRightAngle.Tangent)
                }
            }
        }
    }
}

