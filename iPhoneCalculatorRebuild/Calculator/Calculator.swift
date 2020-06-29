//
//  Calculator.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

enum Calculator {
    case Scientific
    case Standard
}

class Calculators {
    
    //MARK: - Properties
    
    static var active: Calculator = Calculator.Standard
}
