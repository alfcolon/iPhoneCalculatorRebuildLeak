//
//  OutputLabelPortraitConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class OutputLabelPortraitConstraints: CalculatorConstraints {
    
    //MARK: - Properties
    
    let width: NSLayoutConstraint
    var trailing: NSLayoutConstraint?

    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
        let outputLabel: OutputLabel! = labelView!.outputLabel
        
        let viewHeight: CGFloat = labelView.frame.height
        let viewWidth: CGFloat = labelView.frame.width
        let width: CGFloat = viewHeight > viewWidth ? viewWidth : viewHeight
        let space: CGFloat = 25
        let cellHeight: CGFloat = (viewWidth - space) * 0.25
        let customHeight: CGFloat = cellHeight * 5 + space

        self.width = outputLabel.widthAnchor.constraint(lessThanOrEqualToConstant: width - cellHeight / 2)
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
        guard let divisonCellLabel = viewControllerDelegate.standardCalculatorCollectionView.trackedViewCells[3]?.label else { return }
        
        let outputLabel = viewControllerDelegate.labelView.outputLabel!
        
        let dummyLabel = outputLabel.dummyLabel!
        dummyLabel.font = outputLabel.font
        
        self.trailing = outputLabel.trailingAnchor.constraint(equalTo: divisonCellLabel.trailingAnchor, constant: 10)
    }
}
