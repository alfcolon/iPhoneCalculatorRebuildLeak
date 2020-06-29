//
//  ScientificCalculatorCollectionViewUniversalConstraints.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class ScientificCalculatorCollectionViewUniversalConstraints: CalculatorConstraints {
    
    //MARK: - Properties
    
    let bottom: NSLayoutConstraint
    let leading: NSLayoutConstraint
    let top: NSLayoutConstraint
    let trailing: NSLayoutConstraint
    
    //MARK: - Init
    
    override init(viewControllerDelegate: CalculatorViewController) {
        let labelView: LabelView! = viewControllerDelegate.labelView
        let scientificCalculatorCollectionView: ScientificCalculatorCollectionView! = viewControllerDelegate.scientificCalculatorCollectionView
        let view: UIView! = viewControllerDelegate.view
        
        self.bottom = scientificCalculatorCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        
        self.leading = scientificCalculatorCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5)
        
        self.top = scientificCalculatorCollectionView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 0)
        
        self.trailing = scientificCalculatorCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        
        super.init(viewControllerDelegate: viewControllerDelegate)
    }
}
