//
//  StandardCalculator.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/28/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class StandardCalculator {
     
    //MARK: - Properties
    
    static var calculatorCells: [Int : CalculatorCell] {
        [
        0: CalculatorCell.clear(CalculatorCell.Clear.AllClear),
        1: CalculatorCell.toggleNumberSign(CalculatorCell.ToggleNumberSign.ToggleNumberSign),
        2: CalculatorCell.percentageFunction(CalculatorCell.PercentageFunction.PercentageFunction),
        3: CalculatorCell.operator_(CalculatorCell.Operator.Division),
        4: CalculatorCell.digit(CalculatorCell.Digit.Seven),
        5: CalculatorCell.digit(CalculatorCell.Digit.Eight),
        6: CalculatorCell.digit(CalculatorCell.Digit.Nine),
        7: CalculatorCell.operator_(CalculatorCell.Operator.Multiplication),
        8: CalculatorCell.digit(CalculatorCell.Digit.Four),
        9: CalculatorCell.digit(CalculatorCell.Digit.Five),
        10: CalculatorCell.digit(CalculatorCell.Digit.Six),
        11: CalculatorCell.operator_(CalculatorCell.Operator.Subtraction),
        12: CalculatorCell.digit(CalculatorCell.Digit.One),
        13: CalculatorCell.digit(CalculatorCell.Digit.Two),
        14: CalculatorCell.digit(CalculatorCell.Digit.Three),
        15: CalculatorCell.operator_(CalculatorCell.Operator.Addition),
        16: CalculatorCell.digit(CalculatorCell.Digit.Zero),
        17: CalculatorCell.decimal(CalculatorCell.Decimal.Decimal),
        18: CalculatorCell.equal(CalculatorCell.Equal.Equal)
        ]
    }
    static var numberFormatter = StandardCalculatorNumberFormatter()
    static let reuseIdentifier = "StandardCalculatorCell"

    //MARK: - AttributedStringFormatter
    
    enum AttributedStringFormatter {
        case ClearType(String)
        case Decimal(String)
        case Digit(String)
        case Equal(String)
        case Operator(String)
        case PercentageFunction(String)
        case ToggleNumberSignMinus(String)
        case ToggleNumberSignPlus(String)
        case ToggleNumberSignSolidus(String)
        indirect case ToggleNumberSign(AttributedStringFormatter, AttributedStringFormatter, AttributedStringFormatter)

        //MARK: - Attributes

        var baselineOffset: NSNumber { return 0 }

        var font: UIFont! {
            switch self {
            case .Operator:
                return Fonts.SFProTextRegular(45).font
            default:
                return Fonts.SFProTextRegular(40).font
            }
        }

        var kern: Int {
            switch self {
            default:
                return 0
            }
        }

        func range(length: Int) -> NSRange {
            return NSRange(location: 0, length: length)
        }
        
        //MARK: - FormattedAttributedString
        
        var formattedAttributedString: NSAttributedString {
            switch self {
                
            //MARK: - Cases
                
            case .ClearType(let string):
                return formatString(for: string)
            case .Decimal(let string):
                return formatString(for: string)
            case .Digit(let string):
                return formatString(for: string)
            case .Equal(let string):
                return formatString(for: string)
            case .Operator(let string):
                return formatString(for: string)
            case .PercentageFunction(let string):
                return formatString(for: string)
            case .ToggleNumberSignMinus(let string):
                return formatString(for: string)
            case .ToggleNumberSignPlus(let string):
                return formatString(for: string)
            case .ToggleNumberSignSolidus(let string):
                return formatString(for: string)

            //MARK: - Indirect Cases

            case .ToggleNumberSign(let plusSign, let solidus, let minusSign):
                let mutableAttributedString = NSMutableAttributedString()
                
                mutableAttributedString.append(plusSign.formattedAttributedString)
                mutableAttributedString.append(solidus.formattedAttributedString)
                mutableAttributedString.append(minusSign.formattedAttributedString)
                
                return mutableAttributedString
            }
        }
        
        //MARK: - Format String
        
        func formatString(for string: String) -> NSMutableAttributedString {
            let mutableAttributedString = NSMutableAttributedString(string: string)
            
            let range = self.range(length: string.count)
            
            mutableAttributedString.addAttributes([NSAttributedString.Key.baselineOffset : self.baselineOffset], range: range)
            mutableAttributedString.addAttributes([NSAttributedString.Key.kern : self.kern], range: range)
            mutableAttributedString.addAttributes([NSAttributedString.Key.font : self.font!], range: range)
        
            return mutableAttributedString
        }
    }
    
    //MARK: - Compositional Layout
    
    static var compositionalLayout: UICollectionViewLayout {
        let standardCalculatorCellSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalWidth(0.25)
        )
        let standardCalculatorCell = NSCollectionLayoutItem(
            layoutSize: standardCalculatorCellSize
        )
        standardCalculatorCell.contentInsets = NSDirectionalEdgeInsets(
            top: 7.5,
            leading: 7.5,
            bottom: 7.5,
            trailing: 7.5
        )
        let standardCalculatorRowSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.25)
        )
        let standardCalculatorRow = NSCollectionLayoutGroup.horizontal(
            layoutSize: standardCalculatorRowSize,
            subitem: standardCalculatorCell,
            count: 4
        )
        
        //Final Row
        let standardCalculatorZeroCellSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.50),
                heightDimension: .fractionalWidth(0.25)
        )
        
        let standardCalculatorZeroCell = NSCollectionLayoutItem(
            layoutSize: standardCalculatorZeroCellSize
        )
        standardCalculatorZeroCell.contentInsets = NSDirectionalEdgeInsets(
            top: 7.5,
            leading: 7.5,
            bottom: 7.5,
            trailing: 7.5
        )
        
        let standardCalculatorLastRowSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.25)
        )
        let standardCalculatorLastRow = NSCollectionLayoutGroup.horizontal(
            layoutSize: standardCalculatorLastRowSize,
            subitems: [
                standardCalculatorZeroCell,
                standardCalculatorCell,
                standardCalculatorCell
                ]
        )
        
        //Standard Calculator Cell Container
        let standardCalculatorCellContainerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let standardCalculatorCellContainer = NSCollectionLayoutGroup.vertical(
            layoutSize: standardCalculatorCellContainerSize,
            subitems: [
                standardCalculatorRow,
                standardCalculatorRow,
                standardCalculatorRow,
                standardCalculatorRow,
                standardCalculatorLastRow
            ]
        )
        
        let section = NSCollectionLayoutSection(
            group: standardCalculatorCellContainer
        )
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 10,
            bottom: 10,
            trailing: 10
        )
        
        let standardCalculatorLayoutForPortrait = UICollectionViewCompositionalLayout(
            section: section
        )
        
        return standardCalculatorLayoutForPortrait
    }
    
    //MARK: - Methods
    
    class func formatTermNumber(term: Term) -> String {
        guard let number: NSNumber = term.numberValue else { return self.numberFormatter.string(for: nil)! }
        
        switch term {
        case .mutableOperand(let mutableOperand):
            let fractionDigits: Int = mutableOperand.fractionArray.count
            let integerDigits: Int = mutableOperand.integerArray.count
            
            self.numberFormatter.updateProperties(for: number, integerDigits: integerDigits, fractionDigits: fractionDigits)
            
            let formattedNumberString: String! = self.numberFormatter.string(for: number)
            return fractionDigits == 0 && mutableOperand.decimal == true ? formattedNumberString + "." : formattedNumberString
        default:
            let numberString: String = number.stringValue
            let numberSubstring: [Substring] = numberString.split(separator: ".")

            let integerDigits: Int = numberSubstring[0].count
            
            let fractionDigits: Int = {
                guard numberSubstring.count > 1 else { return 0 }
                return numberSubstring[1].count
            }()

            self.numberFormatter.updateProperties(for: number, integerDigits: integerDigits, fractionDigits: fractionDigits)
            
            var formattedNumberString: String! = self.numberFormatter.string(for: number)
            
            //Avoid 9.200000000000000
            if formattedNumberString.contains(".") {
                let reversedFormattedNumberString = formattedNumberString.reversed()
                for char in reversedFormattedNumberString {
                    if char == "0" {
                        formattedNumberString.removeLast()
                    }
                    else if char == "." {
                        formattedNumberString.removeLast()
                        return formattedNumberString
                    }
                    else {
                        return formattedNumberString
                    }
                }
            }
            
            return formattedNumberString
        }
    }
}

class StandardCalculatorNumberFormatter: NumberFormatter {
    
    //MARK: - Properties

    var decimalMaximum: Double = 999999999
    var decimalMinimum: Double = -999999999
    var decimalDigitMaximum: Int = 9
    
    //MARK: - Init
    
    override init() {
        super.init()
        self.exponentSymbol = "e"
        self.negativeInfinitySymbol = "Error"
        self.negativePrefix = "−"
        self.nilSymbol = "Error"
        self.notANumberSymbol = "Error"
        self.positiveInfinitySymbol = "Error"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func updateProperties(for number: NSNumber, integerDigits: Int, fractionDigits: Int) {
        let doubleValue = number.doubleValue
        
        //Floatcheck - Mainly for when the percentage function gets pressed repeatedly
        let useScientificNotationForFloat: Bool = {
            let floatValue = number.floatValue
            let string: String! = String(floatValue.magnitude)
            let substring = string.split(separator: "e")
            if substring.count > 1 {
                let string = substring[1]
                let double: Int! = Int(string)
                self.usesSignificantDigits = true
                let magnitudeLimit: Int = -self.decimalDigitMaximum - integerDigits
                return double < magnitudeLimit
            }
            return false
        }()
        
        //ScientificNotation
        if doubleValue < self.decimalMinimum || doubleValue > self.decimalMaximum || useScientificNotationForFloat {
            self.numberStyle = .scientific
            self.usesGroupingSeparator = false
            self.usesSignificantDigits = true
        }
        //Decimal
        else {
            self.maximumIntegerDigits = integerDigits < self.decimalDigitMaximum ? integerDigits : self.decimalDigitMaximum
            self.maximumIntegerDigits = integerDigits < self.decimalDigitMaximum ? integerDigits : self.decimalDigitMaximum
            
            let availableDigits: Int = self.decimalDigitMaximum
            self.maximumFractionDigits = availableDigits < fractionDigits ? availableDigits : fractionDigits
            self.minimumFractionDigits = availableDigits < fractionDigits ? availableDigits : fractionDigits
            self.numberStyle = .decimal
            self.usesGroupingSeparator = true
            self.usesSignificantDigits = false
        }
    }
}
