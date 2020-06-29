//
//  OutputLabelLandscapeConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class OutputLabelLandscapeConstraints: CalculatorConstraints {
    
    //MARK: - Properties

    let top: NSLayoutConstraint
    let width: NSLayoutConstraint
    var trailing: NSLayoutConstraint?
    
    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
        let outputLabel: OutputLabel! = labelView!.outputLabel
        
        self.top = outputLabel.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 0)
        
        let viewHeight: CGFloat = viewControllerDelegate.view.frame.height
        let viewWidth: CGFloat = viewControllerDelegate.view.frame.width
        let width: CGFloat = viewHeight < viewWidth ? viewWidth : viewHeight

        self.width = outputLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 500)
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
    
    //MARK: - Trailing Constraint Methods
    
    func activateTrailingConstraint() {
        guard self.trailing == nil else { return }
        
        self.updateTrailingConstraint()
        
        guard self.trailing != nil else { return }
        
        NSLayoutConstraint.activate([self.trailing!])
    }
    
    func deactivateTrailingConstraint() {
        guard self.trailing != nil else { return }
        
        NSLayoutConstraint.deactivate([self.trailing!])
        
        self.trailing = nil
    }
    
    func updateTrailingConstraint() {
        guard let divisonCellLabel: CalculatorCollectionViewCellLabel = viewControllerDelegate.scientificCalculatorCollectionView.trackedViewCells[9]?.label else { return }
        
        let outputLabel: OutputLabel! = viewControllerDelegate.labelView.outputLabel
        
        self.trailing = outputLabel.trailingAnchor.constraint(equalTo: divisonCellLabel.trailingAnchor, constant: 10)
    }
}
