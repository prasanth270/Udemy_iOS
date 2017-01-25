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
        //let path = UIBezierPath(ovalIn: rect)
        let radius: CGFloat = frame.width/2
        let point: CGPoint = CGPoint(x: frame.width/2, y: frame.height/2)
        let point1: CGPoint = CGPoint(x: frame.width/2 + radius, y: frame.height/2)
        let point2: CGPoint = CGPoint(x: frame.width/2, y: frame.height/2 + radius)
        let point3: CGPoint = CGPoint(x: frame.width/2, y: frame.height/2 - radius)
        //let shapeLayer = CAShapeLayer()
        
        //shapeLayer.fillColor = mainColor.cgColor
        
        drawArc(origin: point, startPoint: point1, endPoint: point2, radius: radius, startAngle: 0, endAngle: 3.14/2, selectColor: 1)
        drawArc(origin: point, startPoint: point2, endPoint: point3, radius: radius, startAngle: 3.14/2, endAngle: 3.14, selectColor: 2)
        //layer.addSublayer(shapeLayer)
 
        if isSelected {
            //drawBorder(rect: rect)
        }
    }
    
    /* Function to Draw different and fill different areas of a Pie Chart */
    func drawArc(origin: CGPoint, startPoint: CGPoint, endPoint: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, selectColor: Int) {
        
        let linePath = UIBezierPath()
        linePath.lineWidth = 1.0
        linePath.move(to: origin)
        linePath.addLine(to: startPoint)
        linePath.addArc(withCenter: origin, radius: frame.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        linePath.move(to: origin)
        linePath.addLine(to: endPoint)
        
        if selectColor == 1 {
            UIColor.blue.setFill()
        } else if selectColor == 2 {
            UIColor.orange.setFill()
        }
        
        linePath.fill()
        linePath.close()
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
