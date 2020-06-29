//
//  Constraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class Constraints {
    
    //MARK: - Properties
    
    let labelView: LabelViewConstraints
    let outputLabel: OutputLabelConstraints
    let scientificCalculatorCollectionView: ScientificCalculatorCollectionViewConstraints
    let siUnitLabel: SIUnitLabelConstraints
    let standardCalculatorCollectionView: StandardCalculatorCollectionViewConstraints
    let viewControllerDelegate: CalculatorViewController!
    
    //MARK: - Init
    
    init(viewControllerDelegate: CalculatorViewController) {
        self.labelView = LabelViewConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.outputLabel = OutputLabelConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.scientificCalculatorCollectionView = ScientificCalculatorCollectionViewConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.siUnitLabel = SIUnitLabelConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.standardCalculatorCollectionView = StandardCalculatorCollectionViewConstraints(viewControllerDelegate: viewControllerDelegate)
        
        self.viewControllerDelegate = viewControllerDelegate
    }
    
    //MARK: - Orientation Constraints

    func activateOrientationConstraints() {
        switch Calculators.active {
        case .Scientific:
            NSLayoutConstraint.activate([
                self.labelView.landscape.height,
                self.outputLabel.landscape.top,
                self.outputLabel.landscape.width
            ])
        case .Standard:
            NSLayoutConstraint.activate([
                self.outputLabel.portrait.width,
                self.standardCalculatorCollectionView.portrait.height
            ])
        }
    }
    
    func deactivateOrientationConstraints() {
        switch Calculators.active {
        case .Scientific:
            NSLayoutConstraint.deactivate([
                self.labelView.landscape.height,
                self.outputLabel.landscape.top,
                self.outputLabel.landscape.width
            ])
        case .Standard:
            NSLayoutConstraint.deactivate([
                self.outputLabel.portrait.width,
                self.standardCalculatorCollectionView.portrait.height
            ])
        }
    }

    //MARK: - Post-ScientificCollectionView Methods
    
    func deactiveatePostCollectionViewLoadingConstraints() {
        switch Calculators.active {
        case .Scientific:
            self.deactivatePostScientificCollectionViewLoadingConstraints()
        case .Standard:
            self.deactivatePostStandardCollectionViewLoadingConstraints()
        }
    }
    
    func activatePostScientificCollectionViewLoadingConstraints() {
        self.scientificCalculatorCollectionView.landscape.activateDivisionConstraint()
        self.scientificCalculatorCollectionView.landscape.activateZeroConstraint()
        self.outputLabel.landscape.activateTrailingConstraint()
        self.siUnitLabel.landscape.activateCenterXConstraint()
    }
    
    func deactivatePostScientificCollectionViewLoadingConstraints() {
        self.scientificCalculatorCollectionView.landscape.deactivateDivisionConstraint()
        self.scientificCalculatorCollectionView.landscape.deactivateZeroConstraint()
        self.outputLabel.landscape.deactivateTrailingConstraint()
        self.siUnitLabel.landscape.deactivateCenterXConstraint()
    }
    
    //MARK: - Post-StandardCollectionView Loading Methods

    func activatePostStandardCollectionViewLoadingConstraints() {
        self.standardCalculatorCollectionView.portrait.activateDivisionConstraint()
        self.standardCalculatorCollectionView.portrait.activateZeroConstraint()
        self.siUnitLabel.portrait.activateCenterXConstraint()
        self.outputLabel.portrait.activateTrailingConstraint()
    }
    
    func deactivatePostStandardCollectionViewLoadingConstraints() {
        self.standardCalculatorCollectionView.portrait.deactivateDivisionConstraint()
        self.standardCalculatorCollectionView.portrait.deactivateZeroConstraint()
        self.siUnitLabel.portrait.deactivateCenterXConstraint()
        self.outputLabel.portrait.deactivateTrailingConstraint()
    }

    //MARK: - Universal Constraints

    func activateUniversalConstraints() {
        NSLayoutConstraint.activate([
            self.labelView.universal.bottomToScientificCalculator,
            self.labelView.universal.bottomToStandardCalculator,
            self.labelView.universal.leading,
            self.labelView.universal.top,
            self.labelView.universal.trailing,
            self.outputLabel.universal.bottom,
            self.outputLabel.universal.leading,
            self.scientificCalculatorCollectionView.universal.bottom,
            self.scientificCalculatorCollectionView.universal.leading,
            self.scientificCalculatorCollectionView.universal.top,
            self.scientificCalculatorCollectionView.universal.trailing,
            self.siUnitLabel.universal.bottom,
            self.standardCalculatorCollectionView.universal.bottom,
            self.standardCalculatorCollectionView.universal.leading,
            self.standardCalculatorCollectionView.universal.top,
            self.standardCalculatorCollectionView.universal.trailing
        ])
    }
}
