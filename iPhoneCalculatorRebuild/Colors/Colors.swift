//
//  Colors.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit


enum Colors {
    case DarkLiverish
    case EerieBlackish
    case LightGrayish
    case VividGambogeish
    
    var backgroundColor: UIColor {
        switch self {
        case .DarkLiverish:
            return UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        case .EerieBlackish:
            return UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
        case .LightGrayish:
            return UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.00)
        case .VividGambogeish:
            return UIColor(red: 1.00, green: 0.62, blue: 0.04, alpha: 1.00)
        }
    }
    
    var highlightColor: UIColor {
        switch self {
        case .DarkLiverish:
            return UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1.00)
        case .EerieBlackish:
            return UIColor(red: 0.30, green: 0.30, blue: 0.30, alpha: 1.00)
        case .LightGrayish:
            return UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        case .VividGambogeish:
            return UIColor(red: 0.98, green: 0.78, blue: 0.55, alpha: 1.00)
        }
    }
    
    var selectedBackgroundColor: UIColor? {
        switch self {
        case .DarkLiverish:
            return nil
        case .EerieBlackish:
            return UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        case .LightGrayish:
            return nil
        case .VividGambogeish:
            return UIColor.white
        }
    }
    
    var selectedTextColor: UIColor? {
        switch self {
        case .DarkLiverish:
            return nil
        case .EerieBlackish:
            return UIColor.black
        case .LightGrayish:
            return nil
        case .VividGambogeish:
            return self.backgroundColor
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .DarkLiverish:
            return UIColor.white
        case .EerieBlackish:
            return UIColor.white
        case .LightGrayish:
            return UIColor.black
        case .VividGambogeish:
            return UIColor.white
        }
    }
}
