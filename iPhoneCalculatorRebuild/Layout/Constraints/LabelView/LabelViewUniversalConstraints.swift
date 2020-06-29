//
//  LabelViewUniversalConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/12/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class LabelViewUniversalConstraints: CalculatorConstraints {

    //MARK: - Properties

    let bottomToScientificCalculator: NSLayoutConstraint
    let bottomToStandardCalculator: NSLayoutConstraint
    let leading: NSLayoutConstraint
    let trailing: NSLayoutConstraint
    let top: NSLayoutConstraint

    //MARK: - Init

    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
        let scientificCalculatorCollectionView: ScientificCalculatorCollectionView! = viewControllerDelegate.scientificCalculatorCollectionView
        let standardCalculatorCollectionView: StandardCalculatorCollectionView! = viewControllerDelegate.standardCalculatorCollectionView
        let view: UIView! = viewControllerDelegate.view

        self.bottomToScientificCalculator = labelView.bottomAnchor.constraint(equalTo: scientificCalculatorCollectionView.topAnchor, constant: 0)

        self.bottomToStandardCalculator = labelView.bottomAnchor.constraint(equalTo: standardCalculatorCollectionView.topAnchor, constant: 7.5)

        self.leading = labelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)

        self.top = labelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5)
        
        self.trailing = labelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
}
