//
//  ScientificCalculatorCollectionView.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class ScientificCalculatorCollectionView: UICollectionView {

    //MARK: - Properties
    
    var trackedViewCells: [Int : CalculatorCollectionViewCell] = [ : ]
    var viewControllerDelegate: CalculatorViewController!
    
    //MARK: - Init
    
    init(viewController: CalculatorViewController) {
        let compositionalLayout = ScientificCalculator.compositionalLayout
        super.init(frame: viewController.view.frame, collectionViewLayout: compositionalLayout)
        self.viewControllerDelegate = viewController
        self.setupProperties()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Init Helper Methods
    
    private func setupProperties() {
        self.allowsMultipleSelection = false
        self.backgroundColor = UIColor.black
        self.dataSource = viewControllerDelegate
        self.delegate = viewControllerDelegate
        self.register(CalculatorCollectionViewCell.self, forCellWithReuseIdentifier: ScientificCalculator.reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    //MARK: - LayoutMarginsDidChange
    
    override func layoutMarginsDidChange() {
        self.isHidden = Calculators.active == .Scientific ? false : true
    }
    
    //MARK: - LayoutSubviews
    
    override func layoutSubviews() {
        guard Calculators.active == .Scientific else { return }

        if self.visibleCells.count != 49 {
            self.viewControllerDelegate.constraints.deactivatePostScientificCollectionViewLoadingConstraints()
            super.layoutSubviews()
            self.roundCalculatorCellCorners()
        }
        
        self.viewControllerDelegate.constraints!.activatePostScientificCollectionViewLoadingConstraints()
        self.viewControllerDelegate.labelView.outputLabel.updateText()
        self.syncCalculators()
    }

    func roundCalculatorCellCorners() {
        let cells = self.trackedViewCells.values
        for cell in cells {
            cell.layer.cornerRadius = cell.frame.height / 2
            cell.layer.masksToBounds = true
        }
    }
    
    //MARK: - Synching
    
    func syncCalculators() {
        guard self.trackedViewCells.count == 49 else { return }
        guard self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells.count == 19 else { return }
        
        let standardCalculatorAdditionCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[15]
        let standardCalculatorDivisionCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[3]
        let standardCalculatorMultiplicationCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[7]
        let standardCalculatorSubtractionCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[11]
        
        let scientificCalculatorAdditionCell: CalculatorCollectionViewCell! = self.trackedViewCells[39]
        let scientificCalculatorDivisionCell: CalculatorCollectionViewCell! = self.trackedViewCells[9]
        let scientificCalculatorMultiplicationCell: CalculatorCollectionViewCell! = self.trackedViewCells[19]
        let scientificCalculatorSubtractionCell: CalculatorCollectionViewCell! = self.trackedViewCells[29]
        
        scientificCalculatorAdditionCell.isSelected = standardCalculatorAdditionCell.isSelected
        scientificCalculatorDivisionCell.isSelected = standardCalculatorDivisionCell.isSelected
        scientificCalculatorMultiplicationCell.isSelected = standardCalculatorMultiplicationCell.isSelected
        scientificCalculatorSubtractionCell.isSelected = standardCalculatorSubtractionCell.isSelected
        
        let standardCalculatorClearCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[0]
        let scientificCalculatorClearCell: CalculatorCollectionViewCell! = self.trackedViewCells[6]
        if scientificCalculatorClearCell.label.text != standardCalculatorClearCell.label.text {
            scientificCalculatorClearCell.toggleCalculatorCellValue()
        }
    }
    
    //MARK: - Deselected FunctionWithTwoInputs
    
    /*
        Functions with two inputs will be appear deselected:
            - once they receive an input2
            - when the function does not appear in the available functions
                - e.g. when the Toggle Second Set of Functions cell removes logy from the available functions
            - when an operator is selected
            - when another functionWithTwoInputs is selected
        The following cells can be added as input2 and deselect the function
            - constants
            - decimal
            - digits
     */
    func deselectFunctionWithTwoInputsIfNeeded(index: Int) {
        guard self.trackedViewCells.count == 49 else { return }
        
        let selectedCalculatorCell: CalculatorCell! = self.trackedViewCells[index]?.calculatorCell
        
        switch selectedCalculatorCell {
        case .constant, .decimal, .digit, .operator_:
            if index != 13 {
                self.trackedViewCells[13]!.deselectCellIfNeeded() //xy
            }
            if index != 14 {
                self.trackedViewCells[14]!.deselectCellIfNeeded() //yx
            }
            if index != 23 {
                self.trackedViewCells[23]!.deselectCellIfNeeded() //y root x
            }
            if index != 24 {
                self.trackedViewCells[24]!.deselectCellIfNeeded() //logy
            }
            if index != 35 {
                self.trackedViewCells[35]!.deselectCellIfNeeded() //EE
            }
        case .exponentFunction(let function):
            switch function {
            case .BaseXPowerY, .BaseYPowerX, .EnterExponent:
                if index != 13 {
                    self.trackedViewCells[13]!.deselectCellIfNeeded() //xy
                }
                if index != 14 {
                    self.trackedViewCells[14]!.deselectCellIfNeeded() //yx
                }
                if index != 23 {
                    self.trackedViewCells[23]!.deselectCellIfNeeded() //y root x
                }
                if index != 24 {
                    self.trackedViewCells[24]!.deselectCellIfNeeded() //logy
                }
                if index != 35 {
                    self.trackedViewCells[35]!.deselectCellIfNeeded() //EE
                }
            default:
                break
            }
        case .logFunction(let function):
            switch function {
            case .LogBaseY:
                if index != 13 {
                    self.trackedViewCells[13]!.deselectCellIfNeeded() //xy
                }
                if index != 14 {
                    self.trackedViewCells[14]!.deselectCellIfNeeded() //yx
                }
                if index != 23 {
                    self.trackedViewCells[23]!.deselectCellIfNeeded() //y root x
                }
                if index != 24 {
                    self.trackedViewCells[24]!.deselectCellIfNeeded() //logy
                }
                if index != 35 {
                    self.trackedViewCells[35]!.deselectCellIfNeeded() //EE
                }
            default:
                break
            }
        case .rootFunction(let function):
            switch function {
            case .CoefficientYRadicandX:
                if index != 13 {
                    self.trackedViewCells[13]!.deselectCellIfNeeded() //xy
                }
                if index != 14 {
                    self.trackedViewCells[14]!.deselectCellIfNeeded() //yx
                }
                if index != 24 {
                    self.trackedViewCells[24]!.deselectCellIfNeeded() //logy
                }
                if index != 35 {
                    self.trackedViewCells[35]!.deselectCellIfNeeded() //EE
                }
            default:
                break
            }
        case .toggleSecondSetOfFunctions:
            let logy: CalculatorCollectionViewCell! = self.trackedViewCells[24] //logy
            logy.deselectCellIfNeeded()
        default:
            break
        }
    }
    
    //MARK: - Deselect Operator
    
    func deselectOperatorIfNeeded() {
        let additionCell: CalculatorCollectionViewCell! = self.trackedViewCells[39]
        let divisionCell: CalculatorCollectionViewCell! = self.trackedViewCells[9]
        let multiplicationCell: CalculatorCollectionViewCell! = self.trackedViewCells[19]
        let subtractionCell: CalculatorCollectionViewCell! = self.trackedViewCells[29]
        
        if additionCell.isSelected {
            additionCell.isSelected = false
            additionCell.isHighlighted = false
        }
        else if divisionCell.isSelected {
            divisionCell.isSelected = false
            divisionCell.isHighlighted = false
        }
        else if multiplicationCell.isSelected {
            multiplicationCell.isSelected = false
            multiplicationCell.isHighlighted = false
        }
        else if subtractionCell.isSelected {
            subtractionCell.isSelected = false
            subtractionCell.isHighlighted = false
        }
    }
    
    //MARK: - ToggleSecondSetOfFunctions
    func toggleSecondSetOfFunctions() {
        let cell14: CalculatorCollectionViewCell! = self.trackedViewCells[14]
        let cell15: CalculatorCollectionViewCell! = self.trackedViewCells[15]
        let cell24: CalculatorCollectionViewCell! = self.trackedViewCells[24]
        let cell25: CalculatorCollectionViewCell! = self.trackedViewCells[25]
        let cell31: CalculatorCollectionViewCell! = self.trackedViewCells[31]
        let cell32: CalculatorCollectionViewCell! = self.trackedViewCells[32]
        let cell33: CalculatorCollectionViewCell! = self.trackedViewCells[33]
        let cell41: CalculatorCollectionViewCell! = self.trackedViewCells[41]
        let cell42: CalculatorCollectionViewCell! = self.trackedViewCells[42]
        let cell43: CalculatorCollectionViewCell! = self.trackedViewCells[43]
        
        cell14.toggleCalculatorCellValue()
        cell15.toggleCalculatorCellValue()
        cell24.toggleCalculatorCellValue()
        cell25.toggleCalculatorCellValue()
        cell31.toggleCalculatorCellValue()
        cell32.toggleCalculatorCellValue()
        cell33.toggleCalculatorCellValue()
        cell41.toggleCalculatorCellValue()
        cell42.toggleCalculatorCellValue()
        cell43.toggleCalculatorCellValue()
    }
    
    func toggleSIUnit() {
        let siUnitCell: CalculatorCollectionViewCell! = self.trackedViewCells[40]
        
        siUnitCell.toggleCalculatorCellValue()
        
        switch siUnitCell.calculatorCell {
        case .siUnit(let siUnit):
            self.viewControllerDelegate.labelView.siUnitLabel.text = siUnit.siUnitLabelText
        default:
            break
        }
    }
    
    func updateClearCalculatorCellIfNeeded(indexPath: IndexPath) {
        let clearCollectionViewCell: CalculatorCollectionViewCell! = self.trackedViewCells[6]
        let selectedCollectionViewCell: CalculatorCollectionViewCell! = self.trackedViewCells[indexPath.item]
        
        let clearCalculatorCell: CalculatorCell = clearCollectionViewCell.calculatorCell
        let selectedCalculatorCell: CalculatorCell = selectedCollectionViewCell.calculatorCell
        
        switch clearCalculatorCell {
        case .clear(let clearCellType):
            guard clearCellType.togglesCellValue(for: selectedCalculatorCell) == true else { return }

            clearCollectionViewCell.toggleCalculatorCellValue()
        default:
            break
        }
    }
    
    //MARK: - ReselectOperator
    
    func reselectOperator(operator_: CalculatorCell.Operator) {
        switch operator_ {
        case .Addition:
            let additionCell: CalculatorCollectionViewCell! = self.trackedViewCells[39]
            additionCell.isHighlighted = true
            additionCell.isSelected = true
        case .Division:
            let divisionCell: CalculatorCollectionViewCell! = self.trackedViewCells[9]
            divisionCell.isHighlighted = true
            divisionCell.isSelected = true
        case .Multiplication:
            let multiplicationCell: CalculatorCollectionViewCell! = self.trackedViewCells[19]
            multiplicationCell.isHighlighted = true
            multiplicationCell.isSelected = true
        case .Subtraction:
            let subtractionCell: CalculatorCollectionViewCell! = self.trackedViewCells[29]
            subtractionCell.isHighlighted = true
            subtractionCell.isSelected = true
        }
    }
}
