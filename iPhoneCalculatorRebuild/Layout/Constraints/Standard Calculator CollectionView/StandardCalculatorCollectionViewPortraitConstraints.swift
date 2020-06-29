//
//  StandardCalculatorCollectionViewPortraitConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class StandardCalculatorCollectionViewPortraitConstraints: CalculatorConstraints {

    //MARK: - Properties
    
    let height: NSLayoutConstraint
    var divisionWidth: NSLayoutConstraint?
    var zeroCellCenterX: NSLayoutConstraint?

    //MARK: - Init

    override init(viewControllerDelegate: CalculatorViewController) {
        let view: UIView! = viewControllerDelegate.view
        let portraitWidth: CGFloat = view.frame.height > view.frame.width ?
            view.frame.width
            :
            view.frame.height
        let space: CGFloat = 25
        let cellHeight: CGFloat = (portraitWidth - space) * 0.25
        let customHeight: CGFloat = cellHeight * 5 + space

        self.height = viewControllerDelegate.standardCalculatorCollectionView.heightAnchor.constraint(equalToConstant: customHeight)
        
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
        guard let divisionCellLabel: CalculatorCollectionViewCellLabel = viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[3]?.label else { return }
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

        let zeroCellLabel = viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[16]!.label!

        NSLayoutConstraint.activate([zeroCellLabel.centerXConstraint])

        self.zeroCellCenterX = nil
    }

    func updateZeroConstraints() {
        guard let zeroCellLabel = viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[16]?.label else { return }
        guard let clearLabel = viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[0]?.label else { return }

        NSLayoutConstraint.deactivate([zeroCellLabel.centerXConstraint])

        self.zeroCellCenterX = zeroCellLabel.centerXAnchor.constraint(equalTo: clearLabel.centerXAnchor)
    }
}
