//
//  StandardCalculatorCollectionViewUniversalConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class StandardCalculatorCollectionViewUniversalConstraints: CalculatorConstraints {
    
    //MARK: - Properties
    
    let bottom: NSLayoutConstraint
    let leading: NSLayoutConstraint
    let top: NSLayoutConstraint
    let trailing: NSLayoutConstraint
    
    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
        let standardCalculatorCollectionView: StandardCalculatorCollectionView! = viewControllerDelegate.standardCalculatorCollectionView
        let view: UIView = viewControllerDelegate.view
        
        self.bottom = standardCalculatorCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25)
        
        self.leading = standardCalculatorCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        
        self.top = standardCalculatorCollectionView.topAnchor.constraint(lessThanOrEqualTo: labelView.bottomAnchor, constant: -7.5)
        
        self.trailing = standardCalculatorCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
}
