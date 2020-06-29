//
//  CalculatorCollectionViewCell.swift
//  iPhoneCalculatorRebuild
//
//  Created by Alfredo Colon on 5/25/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

import UIKit

class CalculatorCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties

    var calculatorCell: CalculatorCell! { didSet { self.updateProperties() }}
    var label: CalculatorCollectionViewCellLabel!
    
    //MARK: - isHiglighted
    
    override var isHighlighted: Bool {
        didSet {
            switch calculatorCell {
            default:
                self.isHighlighted == true ?
                highlightCell(to: self.calculatorCell.highlightColor, duration: 0.5, options: .curveEaseOut, view: self)
                :
                highlightCell(to: self.calculatorCell.backgroundColor, duration: 0.5, options: .curveEaseOut, view: self)
            }

        }
    }
    
    private func highlightCell(to color: UIColor, duration: TimeInterval, options: UIView.AnimationOptions, view: UIView) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: options,
            animations: { view.backgroundColor = color },
            completion: nil
        )
    }
    
    //MARK: - isSelected
    
    override var isSelected: Bool {
        didSet {
            print("isSelected")
            guard self.calculatorCell.appearenceChangesWhenSelected == true else { return }

            switch self.calculatorCell {
            case .exponentFunction(let function):
                switch function {
                case .BaseXPowerY, .BaseYPowerX, .EnterExponent:
                    if self.label.textColor != UIColor.black {
                        self.updateAppearenceForSelectedCell()
                    }
                    else {
                        self.updateAppearenceForDeselectedCell()
                    }
                default:
                    break
                }
            case .logFunction(let function):
                switch function {
                case .LogBaseY:
                    if self.label.textColor != UIColor.black {
                        self.updateAppearenceForSelectedCell()
                    }
                    else {
                        self.updateAppearenceForDeselectedCell()
                    }
                default:
                    break
                }
            case .rootFunction(let function):
                switch function {
                case .CoefficientYRadicandX:
                    if self.label.textColor == UIColor.black {
                        self.label.textColor = .white
                        let radicalView: RadicalViewDeselected = RadicalViewDeselected(frame: self.frame)
                        self.backgroundView = radicalView
                        
                    }
                    else {
                        self.label.textColor = .black
                        let radicalView: RadicalViewSelected = RadicalViewSelected(frame: self.frame)
                        let selectedBackgroundColor: UIColor! = self.calculatorCell.selectedBackgroundColor
                        
                        radicalView.backgroundColor = selectedBackgroundColor
                        self.backgroundView = radicalView
                        self.backgroundView?.isHidden = false
                    }
                default:
                    break
                }
            case .toggleSecondSetOfFunctions:
                if self.label.textColor == UIColor.black {
                    self.updateAppearenceForDeselectedCell()
                }
                else {
                    self.updateAppearenceForSelectedCell()
                }
            default:
                if self.isSelected {
                    self.updateAppearenceForSelectedCell()
                }
                else {
                    self.updateAppearenceForDeselectedCell()
                }
            }
        }
    }
    
    func updateAppearenceForSelectedCell() {
        guard self.calculatorCell.appearenceChangesWhenSelected else { return }
        self.backgroundColor = self.calculatorCell.selectedBackgroundColor
        self.label.textColor = self.calculatorCell.selectedTextColor
    }
    
    func updateAppearenceForDeselectedCell() {
        guard self.calculatorCell.appearenceChangesWhenSelected else { return }
        self.backgroundColor = self.calculatorCell.backgroundColor
        self.label.textColor = self.calculatorCell.textColor
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Init Helper Method
    
    private func setupSubviews() {
        self.label = CalculatorCollectionViewCellLabel(frame: self.frame)

        self.contentView.addSubview(label)

        self.label.activateConstraints()
    }

    //MARK: - Update Properties

    private func updateProperties() {
        self.backgroundColor = calculatorCell.backgroundColor
        self.label.textColor = calculatorCell.textColor
        self.label.attributedText = self.calculatorCell.attributedString
        self.addRadicalViewIfNeeded()
    }
    
    private func addRadicalViewIfNeeded() {
        switch self.calculatorCell {
        case .rootFunction:
            self.backgroundView = RadicalViewDeselected(frame: self.frame)
        default:
            break
        }
    }

    func toggleCalculatorCellValue() {
        guard let calculatorCellToggledValue = self.calculatorCell.toggledValue else { return }
        
        self.calculatorCell = calculatorCellToggledValue
    }
    
    func deselectCellIfNeeded() {
        //Quick check
        if self.label.textColor == self.calculatorCell.selectedTextColor {
            switch self.calculatorCell {
            case .rootFunction(let function):
                switch function {
                case .CoefficientYRadicandX:
                    print("deselecting y root x")
                    self.label.textColor = .white
                    let radicalView: RadicalViewDeselected = RadicalViewDeselected(frame: self.frame)
                    self.backgroundView = radicalView
                default:
                    break
                }
            default:
                self.updateAppearenceForDeselectedCell()
            }
        }
    }
}
