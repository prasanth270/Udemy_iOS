//
//  DrawPieChartView.swift
//  EasyShare
//
//  Created by Prasanth Ramineni on 1/14/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

@IBDesignable
class DrawPieChartView: UIView {
    
    @IBInspectable var mainColor: UIColor = UIColor.blue {
        didSet {
            print("Main Color is Set Here")
        }
    }
    
    @IBInspectable var ringColor: UIColor = UIColor.orange {
        didSet {
            print("Ring Color is Set Here")
        }
    }
    
    /* Defines Thickness of the border */
    @IBInspectable var ringThickness: CGFloat = 4 {
        didSet {
            print("Ring Thickness is set Here")
        }
    }
    
    /* Set drawBorder */
    @IBInspectable var isSelected: Bool = true

    
    /* Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation. */
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = mainColor.cgColor
        
        layer.addSublayer(shapeLayer)
        
        if isSelected {
            drawBorder(rect: rect)
        }
    }
    
    /* */
    func drawBorder(rect: CGRect) {
        let hw: CGFloat = ringThickness*2
        
        let newRect = rect.insetBy(dx: hw, dy: hw);
        
        let circlePath = UIBezierPath(ovalIn: newRect)
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = ringColor.cgColor
        shapeLayer.lineWidth = ringThickness
        layer.addSublayer(shapeLayer)
    }

}
