//
//  SIUnitLabel.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class SIUnitLabel: UILabel {

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
        self.font = Fonts.SFProTextRegular(15).font
        self.textAlignment = .right
        self.textColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Methods
    
    override func layoutMarginsDidChange() {
        self.isHidden = self.superview!.frame.width > self.superview!.frame.height ? false : true
    }
}
