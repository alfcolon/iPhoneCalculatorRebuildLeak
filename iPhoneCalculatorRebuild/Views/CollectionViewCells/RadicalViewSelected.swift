//
//  RadicalViewSelected.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/12/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class RadicalViewSelected: UIView {

    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Init Helper Methods
    
    private func setupProperties() {
        self.backgroundColor = UIColor.clear
        self.isHidden = true
    }
    
    //MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        let cell = superview! as! CalculatorCollectionViewCell
        let labelCenter = cell.label.center
        let strokeColor = UIColor.black.cgColor
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(strokeColor)
        
        //Roof
        let roofStartPoint = CGPoint(x: labelCenter.x, y: labelCenter.y - 5)
        context?.move (to: roofStartPoint)
        let roofEndPoint = CGPoint(x: roofStartPoint.x + 10, y: roofStartPoint.y)
        context?.addLine (to: roofEndPoint)
        
        //Diagonal
        context?.move (to: roofStartPoint)
        let digonalEndPoint = CGPoint(x: roofStartPoint.x - 5, y: roofStartPoint.y + 15)
        context?.addLine (to: digonalEndPoint)
        
        //BottomLine
        context?.move (to: digonalEndPoint)
        let hookBaseEndPoint = CGPoint(x: digonalEndPoint.x - 1, y: digonalEndPoint.y)
        context?.addLine(to: hookBaseEndPoint)

        //Hook
        context?.move (to: hookBaseEndPoint)
        let hookEndPoint = CGPoint(x: hookBaseEndPoint.x - 2, y: hookBaseEndPoint.y - 6)
        context?.addLine(to: hookEndPoint)
        
        context?.strokePath()
    }
}
