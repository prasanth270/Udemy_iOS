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
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.fillColor = mainColor.cgColor
        
//        let linePath = UIBezierPath()
//        linePath.lineWidth = 1.0
//        linePath.move(to: point)
//        linePath.addLine(to: CGPoint(x: frame.width/2 + radius, y: frame.height/2))
//        linePath.addArc(withCenter: point, radius: frame.width/2, startAngle: 0, endAngle: 3.14/2, clockwise: true)
//        linePath.move(to: point)
//        linePath.addLine(to: CGPoint(x: frame.width/2, y: frame.height/2 + radius))
//        
//        linePath.fill()
        
        drawArc(centerPoint: point, startPoint: point1, endPoint: point2, radius: radius, startAngle: 0, endAngle: 3.14/2, lineWidth: 1, selectColor: 1)
        drawArc(centerPoint: point, startPoint: point2, endPoint: point3, radius: radius, startAngle: 3.14/2, endAngle: 3.14, lineWidth: 1, selectColor: 2)
        //layer.addSublayer(shapeLayer)
 
        if isSelected {
            //drawBorder(rect: rect)
        }
    }
    
    func drawArc(centerPoint: CGPoint, startPoint: CGPoint, endPoint: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, lineWidth: CGFloat, selectColor: Int) {
        
        let linePath = UIBezierPath()
        linePath.lineWidth = 1.0
        linePath.move(to: centerPoint)
        linePath.addLine(to: startPoint)
        linePath.addArc(withCenter: centerPoint, radius: frame.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        linePath.move(to: centerPoint)
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
    
//    @IBInspectable var progress : Double =  0.0 {
//        didSet {
//            self.setNeedsDisplay()
//        }
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.contentMode = .redraw
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor =  UIColor.black
//        self.contentMode = .redraw
//    }
    
//    override func draw(_ rect: CGRect) {
//        let color = UIColor.black
//        let linewidth: CGFloat = 2.0
//        
//        let margin: CGFloat = linewidth
//        let box0 = self.bounds.insetBy(dx: margin, dy: margin)
//        let side: CGFloat = min(box0.width, box0.height)
//        let box = CGRect(x: (self.bounds.width - side)/2, y: (self.bounds.height - side)/2, width: side, height: side)
//        //let box = CGRectMake((self.bounds.width - side)/2, (self.bounds.height - side)/2, side, side)
//        
//        let ctx = UIGraphicsGetCurrentContext()
//        
//        ctx!.beginPath()
//        //ctx!.setStrokeColor(color as! CGColor)
//        ctx!.setLineWidth(linewidth)
//        ctx!.addEllipse(in: box)
//        ctx!.closePath()
//        ctx!.strokePath()
//        
//        
//        let delta: CGFloat = -CGFloat(M_PI_2)
//        let radius: CGFloat = min(box.width, box.height)/2.0
//        
//        func prog_to_rad(p: Double) -> CGFloat {
//            let rad = CGFloat(p * 2 * M_PI)
//            return rad + delta
//        }
//
//        func draw_arc(s: CGFloat, e: CGFloat, color: CGColor) {
//            print("Helloooooo")
//            ctx!.beginPath()
//            let point = CGPoint(x: box.midX, y: box.midY)
//            ctx!.move(to: point)
//            //CGContextMoveToPoint(ctx, box.midX, box.midY)
//            ctx!.setFillColor(color)
//            
//            ctx!.addArc(center: point, radius: radius - linewidth/2, startAngle: s, endAngle: 3, clockwise: true)
//            
////            CGContextAddArc(
////                ctx,
////                box.midX,
////                box.midY,
////                radius-linewidth/2,
////                s,
////                e,
////                0)
//            
//            ctx!.closePath()
//            ctx?.fillPath()
//        }
//        
//        
//    }
    
}
