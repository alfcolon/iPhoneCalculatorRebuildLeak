//
//  ScientificCalculatorCollectionViewLandscapeConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class ScientificCalculatorCollectionViewLandscapeConstraints: CalculatorConstraints {

    //MARK: - Properties

    var divisionWidth: NSLayoutConstraint?
    var zeroCellCenterX: NSLayoutConstraint?

    //MARK: - Init

    override init(viewControllerDelegate: CalculatorViewController) {
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
    
    //MARK: - Division Cell
    
    func activateDivisionConstraint() {
        guard self.divisionWidth == nil else { return }

        self.updateDivisionConstraints()

        guard self.divisionWidth != nil else { return }

        NSLayoutConstraint.activate([self.divisionWidth!])
    }

    func deactivateDivisionConstraint() {
        guard self.divisionWidth != nil else { return }
    
        NSLayoutConstraint.deactivate([self.divisionWidth!])
        
        self.divisionWidth = nil
    }

    func updateDivisionConstraints() {
        guard let divisionCellLabel: CalculatorCollectionViewCellLabel = viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells [9]?.label else { return }
        guard let dummyLabel: DummyLabel = viewControllerDelegate.labelView.outputLabel.dummyLabel else { return }

        self.divisionWidth = divisionCellLabel.widthAnchor.constraint(equalTo: dummyLabel.widthAnchor)
    }
    
    //MARK: - Zero Label Constraint Methods

    func activateZeroConstraint() {
        guard self.zeroCellCenterX == nil else { return }

        self.updateZeroConstraints()

        guard self.zeroCellCenterX != nil else { return }

        NSLayoutConstraint.activate([self.zeroCellCenterX!])
    }

    func deactivateZeroConstraint() {
        guard self.zeroCellCenterX != nil else { return }

        NSLayoutConstraint.deactivate([self.zeroCellCenterX!])

        let zeroCellLabel: CalculatorCollectionViewCellLabel! = viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[46]!.label

        NSLayoutConstraint.activate([zeroCellLabel.centerXConstraint])

        self.zeroCellCenterX = nil
    }

    func updateZeroConstraints() {
        guard let zeroCellLabel: CalculatorCollectionViewCellLabel = viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[46]?.label else { return }
        guard let sevenCellLabel: CalculatorCollectionViewCellLabel = viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[36]?.label else { return }
        
        NSLayoutConstraint.deactivate([zeroCellLabel.centerXConstraint])

        self.zeroCellCenterX = zeroCellLabel.centerXAnchor.constraint(equalTo: sevenCellLabel.centerXAnchor)
    }
}
