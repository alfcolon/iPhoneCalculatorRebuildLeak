//
//  Fonts.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/26/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

enum Fonts {
    case SFProDisplayLight(CGFloat)
    case SFProDisplayRegular(CGFloat)
    case SFProDisplayThin(CGFloat)
    case SFProTextLight(CGFloat)
    case SFProTextRegular(CGFloat)
    case SFProTextThin(CGFloat)

    //MARK: - Computed Properties

    var font: UIFont! {
        switch self {
        case .SFProDisplayLight(let size):
            return UIFont(name: "SFProDisplay-Light", size: size)
        case .SFProDisplayRegular(let size):
            return UIFont(name: "SFProDisplay-Regular", size: size)
        case .SFProDisplayThin(let size):
            return UIFont(name: "SFProDisplay-Thin", size: size)
        case .SFProTextLight(let size):
            return UIFont(name: "SFProText-Light", size: size)
        case .SFProTextRegular(let size):
            return UIFont(name: "SFProText-Regular", size: size)
        case .SFProTextThin(let size):
            return UIFont(name: "SFProText-Thin", size: size)
        }
    }
}
