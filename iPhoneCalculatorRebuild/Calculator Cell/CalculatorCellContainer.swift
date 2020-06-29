//
//  CalculatorCellContainer.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/3/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class CalculatorCellContainer: Hashable {
    
    //MARK: - Properties
    
    var attributedString: NSAttributedString!
    var calculatorCell: CalculatorCell { didSet { self.attributedString = self.calculatorCell.attributedString }}
    let identifier: UUID
    
    //MARK: - Init
    
    init(_ calculatorCell: CalculatorCell) {
        self.calculatorCell = calculatorCell
        
        self.attributedString = self.calculatorCell.attributedString
        
        self.identifier = UUID()
    }
    
    //MARK: - Hashable Protocol Methods
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: CalculatorCellContainer, rhs: CalculatorCellContainer) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    //MARK: - Methods
    
    func toggleCalculatorCellValue() {
        guard let calculatorCell = self.calculatorCell.toggledValue else { return }
        
        self.calculatorCell = calculatorCell
    }
}

