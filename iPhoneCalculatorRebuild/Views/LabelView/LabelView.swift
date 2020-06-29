//
//  LabelView.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 6/12/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class LabelView: UIView {

    //MARK: - Properties
    
    var delegate: CalculatorViewController!
    var menu: MenuController!
    var outputLabel: OutputLabel!
    var siUnitLabel: SIUnitLabel!

    override var canBecomeFirstResponder: Bool { return true }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProperties()
        self.setupSubviews()
        self.setupGestureRecognizers()
        self.menu = MenuController(delegate: self.outputLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Init Helper Methods

    private func setupGestureRecognizers() {
        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(showTextEditingMenu))
        longPressedGesture.minimumPressDuration = 0.5
        self.addGestureRecognizer(longPressedGesture)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToLeftSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeDown)
    }
    
    private func setupProperties() {
        self.backgroundColor = .black
        self.becomeFirstResponder()
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        self.outputLabel = OutputLabel(frame: self.frame)
        self.siUnitLabel = SIUnitLabel(frame: self.frame)
        
        self.addSubview(self.outputLabel)
        self.addSubview(self.siUnitLabel)
    }

    //MARK: - LayoutMarginsDidChange
    
    override func layoutMarginsDidChange() {
        self.siUnitLabel.isHidden = Calculators.active == .Scientific ? false : true
    }

    //MARK: - Long Press
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.outputLabel.backgroundColor = .clear

        self.menu.hideMenu()
    }
    /*
        This method does three things
            1. It deletes the last digit from a mutableOperand
                - so the last calculator entry must be a mutableOperand
            2. It also reanimates the last operator selected if the last digit in the mutableOperand was deleted
                - in that case the mutableOperand will just
            3. It also deletes the negative symbol if the leftswipe occured in the output label itself and not the labelView
                - coordinates could help with that one
                - or I may have to have this be the outputLabel or
                - there can be aresponder switch responders
     */

    //MARK: - Left Swipe
    
    @objc private func respondToLeftSwipeGesture(gesture: UIGestureRecognizer) {
        let index: Int! = delegate.calculatorBrain.arithmeticController.parentheticalExpressionIndex
        let precedenceOperation: PrecedenceOperation! = delegate.calculatorBrain.arithmeticController.precedenceOperations[index]?.currentPrecedenceOperation
        let termPointer: UnsafeMutablePointer<Term> = precedenceOperation.pointerToTermToUpdate
        
        switch termPointer.pointee {
        case .mutableOperand(let mutableOperand):
            //Remove last digit or decimal
            mutableOperand.removeLastDigit()
            
            //Remove negative symbol if the location of the left swipe happended within the outputLabel view
            let locationOfLeftSwipe = gesture.location(in: self.outputLabel)
            print(locationOfLeftSwipe)
            if locationOfLeftSwipe.x > 0 && locationOfLeftSwipe.y > 0 && mutableOperand.toggleSign {
                mutableOperand.toggleSign.toggle()
            }
            
            //Reset the last operator if needed
            let mutableOperandHasOneDigit: Bool =  mutableOperand.fractionArray.count == 0 && mutableOperand.decimal == false && mutableOperand.integerArray.count == 1
            
            if mutableOperandHasOneDigit && precedenceOperation.rightTermIsSet {
                let operator_: CalculatorCell.Operator! = precedenceOperation.operator_
                
                switch Calculators.active {
                case .Scientific:
                    delegate.scientificCalculatorCollectionView.reselectOperator(operator_: operator_)
                case .Standard:
                    delegate.standardCalculatorCollectionView.reselectOperator(operator_: operator_)
                }
            }
            
            //update output term
            self.outputLabel.outputTerm = termPointer.pointee
            self.outputLabel.updateText()
        default:
            return
        }
    }

    //MARK: - Text-editing Menu

    @objc private func showTextEditingMenu(_ gesture: UILongPressGestureRecognizer) {
        guard !self.menu.isMenuVisible else { return }

        let menuItemCopy = UIMenuItem(title: "Copy", action: #selector(copyText))
        let menuItemPaste = UIMenuItem(title: "Paste", action: #selector(pasteText))

        self.menu.menuItems = self.menu.copiedDouble == nil ? [menuItemCopy] : [menuItemCopy, menuItemPaste]
        self.menu.showMenu(from: self.outputLabel, rect: self.outputLabel.bounds)

        self.outputLabel.backgroundColor = Colors.EerieBlackish.backgroundColor
    }

    @objc private func copyText() {
        guard self.outputLabel.text != "Error" else { return }
        guard let double = self.outputLabel.outputTerm.doubleValue else { return }

        self.menu.copiedDouble = double

        self.menu.pasteBoard.string = String(double)
    }

    @objc private func pasteText() {
        guard self.menu.copiedDouble != nil else { return }
        
        self.outputLabel.outputTerm = Term.init(double: self.menu.copiedDouble!)
        self.outputLabel.updateText()
    }
}

class MenuController: UIMenuController {
    
    //MARK: - Properties
    
    var copiedDouble: Double?
    let delegate: OutputLabel
    let pasteBoard: UIPasteboard
    
    //MARK: - Init
    
    init(delegate: OutputLabel) {
        self.delegate = delegate
        
        self.pasteBoard = UIPasteboard()
        
        super.init()
    }
}
