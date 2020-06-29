//
//  CalculatorCollectionViewCellLabel.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class CalculatorCollectionViewCellLabel: UILabel {

    //MARK: - Properties
    
    var centerXConstraint: NSLayoutConstraint!
    var centerYConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!

    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupProperties() {
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func activateConstraints() {
        self.centerXConstraint = self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor)
        self.centerYConstraint = self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor)

        NSLayoutConstraint.activate([self.centerXConstraint, self.centerYConstraint])
    }
}
