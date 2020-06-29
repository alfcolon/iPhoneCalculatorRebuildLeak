//
//  OutputLabel.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class OutputLabel: UILabel {
    
    //MARK: - Properties
    
    var dummyLabel: DummyLabel!
    var outputTerm: Term! //{ didSet { self.updateText() }}
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupSubviews()
        self.setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Init Helper Method
    
    private func setupSubviews() {
        self.dummyLabel = DummyLabel(frame: self.frame)
        self.addSubview(dummyLabel)
        self.dummyLabel.text = "0"
        self.dummyLabel.isHidden = true
    }
    
    private func setupProperties() {
        self.outputTerm = Term.ThisTermNeedsToBeSet
        self.textAlignment = .right
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = "0"
        self.font = Fonts.SFProTextRegular(45).font
        self.textColor = .white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.adjustsFontSizeToFitWidth = true
        self.allowsDefaultTighteningForTruncation = true
        self.minimumScaleFactor = 0.5
    }

    //MARK: - Methods
    
    func updateText() {
        switch Calculators.active {
        case .Scientific:
            self.font = Fonts.SFProTextRegular(50).font
            self.text = ScientificCalculator.formatTermNumber(term: self.outputTerm)
            self.dummyLabel.font = self.font
            self.backgroundColor = .clear
        case .Standard:
            self.font = Fonts.SFProDisplayThin(95).font
            let text = StandardCalculator.formatTermNumber(term: self.outputTerm)
            self.text = text
            self.dummyLabel.font = self.font
            self.backgroundColor = .clear
        }
    }
    
    //MARK: - Padding
    
    let padding = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}
