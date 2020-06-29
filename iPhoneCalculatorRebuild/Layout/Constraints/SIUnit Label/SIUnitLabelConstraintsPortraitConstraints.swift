//
//  SIUnitLabelConstraintsPortraitConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class SIUnitLabelConstraintsPortraitConstraints: CalculatorConstraints {
    
    //MARK: - Properties
    
    var centerX: NSLayoutConstraint?

    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
    
    //MARK: - CenterX Constraint Methods

    func activateCenterXConstraint() {
        guard self.centerX == nil else { return }

        self.updateCenterXConstraint()

        guard self.centerX != nil else { return }

        NSLayoutConstraint.activate([self.centerX!])
    }

    func deactivateCenterXConstraint() {
        guard self.centerX != nil else { return }

        NSLayoutConstraint.deactivate([self.centerX!])

        self.centerX = nil
    }
    
    func updateCenterXConstraint() {
        guard let clearCell: CalculatorCollectionViewCell = self.viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[0] else { return }
        
        let siUnitLabel: SIUnitLabel! = viewControllerDelegate.labelView.siUnitLabel
        
        self.centerX = siUnitLabel.centerXAnchor.constraint(equalTo: clearCell.centerXAnchor)
    }
}
