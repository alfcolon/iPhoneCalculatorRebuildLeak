//
//  StandardCalculatorCollectionView.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class StandardCalculatorCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    var trackedViewCells: [Int : CalculatorCollectionViewCell] = [ : ]
    var viewControllerDelegate: CalculatorViewController!
    
    //MARK: - Init
    
    init(viewController: CalculatorViewController) {
        let compositionalLayout = StandardCalculator.compositionalLayout
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
        self.register(CalculatorCollectionViewCell.self, forCellWithReuseIdentifier: StandardCalculator.reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - LayoutMarginsDidChange
    
    override func layoutMarginsDidChange() {
        self.isHidden = Calculators.active == .Standard ? false : true
    }
    
    //MARK: - LayoutSubviews
    
    override func layoutSubviews() {
        guard Calculators.active == .Standard else { return }

        if self.visibleCells.count != 19 {
            self.viewControllerDelegate.constraints.deactivatePostStandardCollectionViewLoadingConstraints()
            super.layoutSubviews()
            self.roundCalculatorCellCorners()
        }
        self.viewControllerDelegate.constraints.activatePostStandardCollectionViewLoadingConstraints()
        self.viewControllerDelegate.labelView.outputLabel.updateText()
        
        self.syncCalculators()
    }
        
    //MARK: - Syncing
    
    func syncCalculators() {
        guard self.trackedViewCells.count == 19 else { return }
        guard self.viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells.count == 49 else { return }

        let scientificCalculatorAdditionCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[39]
        let scientificCalculatorDivisionCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[9]
        let scientificCalculatorMultiplicationCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[19]
        let scientificCalculatorSubtractionCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[29]

        let standardCalculatorAdditionCell: CalculatorCollectionViewCell! = self.trackedViewCells[15]
        let standardCalculatorDivisionCell: CalculatorCollectionViewCell! = self.trackedViewCells[3]
        let standardCalculatorMultiplicationCell: CalculatorCollectionViewCell! = self.trackedViewCells[7]
        let standardCalculatorSubtractionCell: CalculatorCollectionViewCell! = self.trackedViewCells[11]
        
        standardCalculatorAdditionCell.isSelected = scientificCalculatorAdditionCell.isSelected
        standardCalculatorDivisionCell.isSelected = scientificCalculatorDivisionCell.isSelected
        standardCalculatorMultiplicationCell.isSelected = scientificCalculatorMultiplicationCell.isSelected
        standardCalculatorSubtractionCell.isSelected = scientificCalculatorSubtractionCell.isSelected
        
        let scientificCalculatorClearCell: CalculatorCollectionViewCell! = self.viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[6]
        let standardCalculatorClearCell: CalculatorCollectionViewCell! = self.trackedViewCells[0]
        if standardCalculatorClearCell.label.text != scientificCalculatorClearCell.label.text {
            standardCalculatorClearCell.toggleCalculatorCellValue()
        }
    }
    
    func roundCalculatorCellCorners() {
        let cells = self.trackedViewCells.values
        
        for cell in cells {
            cell.layer.cornerRadius = cell.frame.height / 2
            cell.layer.masksToBounds = true
        }
    }
    
    //MARK: - Did(De)Select Helper Methods
    
    func deselectOperatorIfNeeded() {
        let additionCell: CalculatorCollectionViewCell! = self.trackedViewCells[15]
        let divisionCell: CalculatorCollectionViewCell! = self.trackedViewCells[3]
        let multiplicationCell: CalculatorCollectionViewCell! = self.trackedViewCells[7]
        let subtractionCell: CalculatorCollectionViewCell! = self.trackedViewCells[11]
        
        if additionCell.isSelected == true {
            additionCell.isSelected = false
        }
        else if divisionCell.isSelected == true {
            divisionCell.isSelected = false
        }
        else if multiplicationCell.isSelected == true {
            multiplicationCell.isSelected = false
        }
        else if subtractionCell.isSelected == true {
            subtractionCell.isSelected = false
        }
    }
    
    func updateClearCalculatorCellIfNeeded(indexPath: IndexPath) {
        let clearCollectionViewCell: CalculatorCollectionViewCell! = self.trackedViewCells[0]
        let selectedCollectionViewCell: CalculatorCollectionViewCell! = self.trackedViewCells[indexPath.item]
        
        let clearCalculatorCell: CalculatorCell! = clearCollectionViewCell.calculatorCell
        let selectedCalculatorCell: CalculatorCell! = selectedCollectionViewCell.calculatorCell
        
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
            let additionCell: CalculatorCollectionViewCell! = self.trackedViewCells[15]
            additionCell.isHighlighted = true
            additionCell.isSelected = true
        case .Division:
            let divisionCell: CalculatorCollectionViewCell! = self.trackedViewCells[3]
            divisionCell.isHighlighted = true
            divisionCell.isSelected = true
        case .Multiplication:
            let multiplicationCell: CalculatorCollectionViewCell! = self.trackedViewCells[7]
            multiplicationCell.isHighlighted = true
            multiplicationCell.isSelected = true
        case .Subtraction:
            let subtractionCell: CalculatorCollectionViewCell! = self.trackedViewCells[11]
            subtractionCell.isHighlighted = true
            subtractionCell.isSelected = true
        }
    }
}
