//
//  CalculatorViewController.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    //MARK: - Properties
    
    var calculatorBrain: CalculatorBrain!
    var constraints: Constraints!
    var labelView: LabelView!
    var scientificCalculatorCollectionView: ScientificCalculatorCollectionView!
    var standardCalculatorCollectionView: StandardCalculatorCollectionView!
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        //1.Update Properties
        self.labelView = LabelView(frame: self.view.frame)
        self.scientificCalculatorCollectionView = ScientificCalculatorCollectionView(viewController: self)
        self.standardCalculatorCollectionView = StandardCalculatorCollectionView(viewController: self)
        
        //2.Add Subviews
        self.view.addSubview(self.scientificCalculatorCollectionView)
        self.view.addSubview(self.standardCalculatorCollectionView)
        self.view.addSubview(self.labelView)

        //3.Set up constraints
        self.constraints = Constraints(viewControllerDelegate: self)
        self.constraints.activateUniversalConstraints()
        self.labelView.delegate = self
        
        //4.Setup CalculatorBrain
        self.calculatorBrain = CalculatorBrain(outputLabelDelegate: self.labelView.outputLabel)
    }

    override func viewLayoutMarginsDidChange() {
        Calculators.active = self.view.frame.height < self.view.frame.width ? .Scientific : .Standard
        
        self.constraints.activateOrientationConstraints()
        self.labelView.layoutMarginsDidChange()
        self.scientificCalculatorCollectionView.layoutMarginsDidChange()
        self.standardCalculatorCollectionView.layoutMarginsDidChange()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        constraints.deactivateOrientationConstraints()
        constraints.deactiveatePostCollectionViewLoadingConstraints()
    }
}

//MARK: - UICollectionViewDataSource

extension CalculatorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.scientificCalculatorCollectionView:
            return ScientificCalculator.calculatorCells.count
        case self.standardCalculatorCollectionView:
            return StandardCalculator.calculatorCells.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.scientificCalculatorCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScientificCalculator.reuseIdentifier, for: indexPath) as? CalculatorCollectionViewCell else { return UICollectionViewCell() }
            if self.scientificCalculatorCollectionView.trackedViewCells.count == ScientificCalculator.calculatorCells.count {
                cell.calculatorCell = self.scientificCalculatorCollectionView.trackedViewCells[indexPath.item]!.calculatorCell
                cell.isSelected = self.scientificCalculatorCollectionView.trackedViewCells[indexPath.item]!.isSelected
                self.scientificCalculatorCollectionView.trackedViewCells[indexPath.item] = cell
            }
            else {
                cell.calculatorCell = ScientificCalculator.calculatorCells[indexPath.item]
                self.scientificCalculatorCollectionView.trackedViewCells[indexPath.item] = cell
            }
            
            return cell
        case self.standardCalculatorCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StandardCalculator.reuseIdentifier, for: indexPath) as? CalculatorCollectionViewCell else { return UICollectionViewCell() }
            if self.standardCalculatorCollectionView.trackedViewCells.count == StandardCalculator.calculatorCells.count {
                cell.calculatorCell = self.standardCalculatorCollectionView.trackedViewCells[indexPath.item]!.calculatorCell
                cell.isSelected = self.standardCalculatorCollectionView.trackedViewCells[indexPath.item]!.isSelected
                self.standardCalculatorCollectionView.trackedViewCells[indexPath.item] = cell
            }
            else {
                cell.calculatorCell = StandardCalculator.calculatorCells[indexPath.item]
                self.standardCalculatorCollectionView.trackedViewCells[indexPath.item] = cell
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

//MARK: - UICollectionViewDelegate

extension CalculatorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //1.Set up variable for calculatorCell to be handled by CalculatorBrain
        var calculatorCell: CalculatorCell!
        
        //2.Take care of any view realted actions
        switch collectionView {
        case self.scientificCalculatorCollectionView:
            calculatorCell = self.scientificCalculatorCollectionView.trackedViewCells[indexPath.item]!.calculatorCell
            switch calculatorCell {
            case .siUnit:
                self.scientificCalculatorCollectionView.toggleSIUnit()
            case .toggleSecondSetOfFunctions:
                self.scientificCalculatorCollectionView.toggleSecondSetOfFunctions()
                self.scientificCalculatorCollectionView.deselectFunctionWithTwoInputsIfNeeded(index: indexPath.item)
            default:
                self.scientificCalculatorCollectionView.updateClearCalculatorCellIfNeeded(indexPath: indexPath)
                self.scientificCalculatorCollectionView.deselectOperatorIfNeeded()
                self.scientificCalculatorCollectionView.deselectFunctionWithTwoInputsIfNeeded(index: indexPath.item)
            }
        case self.standardCalculatorCollectionView:
            calculatorCell = self.standardCalculatorCollectionView.trackedViewCells[indexPath.item]!.calculatorCell
            self.standardCalculatorCollectionView.updateClearCalculatorCellIfNeeded(indexPath: indexPath)
            self.standardCalculatorCollectionView.deselectOperatorIfNeeded()
        default:
            break
        }
        print("selected cell")
        //3.Send calculatorCell sent off to calculatorBrain
        print("calculatorCell:\t\(calculatorCell.attributedString.string)")
        self.calculatorBrain.evaluateSelectedCalculatorCell(calculatorCell)
        self.labelView.outputLabel.updateText()
    }
}
