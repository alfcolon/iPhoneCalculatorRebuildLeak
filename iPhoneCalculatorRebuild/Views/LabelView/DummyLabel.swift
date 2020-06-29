//
//  DummyLabel.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class DummyLabel: UILabel {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Init Helper Method
    
    private func setupProperties() {
        self.font = Fonts.SFProTextRegular(25).font
        self.text = "0"
        self.textAlignment = .right
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
