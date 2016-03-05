//
//  MSProgressSlider.swift
//  Pods
//
//  Created by messeb on 03/05/2016.
//  Copyright (c) 2016 messeb. All rights reserved.
//

import UIKit

public class MSProgressSlider: UISlider {
    
    @IBInspectable public var progressValue: Float = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    private var _completeColor: UIColor? = UIColor.darkGrayColor()
    private var _progressColor: UIColor? = UIColor.lightGrayColor()
    private var _valueColor: UIColor? = UIColor.redColor()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        guard let progressColor = self.progressColor, let valueColor = self.valueColor, let completeColor = self.completeColor else {
            return
        }
        
        let drawingRect = rect
        let progressWidth = self.progressValue / (self.maximumValue + self.minimumValue)
        
        
        UIGraphicsBeginImageContextWithOptions(drawingRect.size, false, UIScreen.mainScreen().scale);
        let context = UIGraphicsGetCurrentContext();
        
        CGContextMoveToPoint(context, 0, CGRectGetHeight(drawingRect)/2);
        CGContextSetStrokeColorWithColor(context, progressColor.CGColor);
        CGContextAddLineToPoint(context, drawingRect.size.width * CGFloat(progressWidth), CGRectGetHeight(drawingRect)/2);
        CGContextStrokePath(context);
        
        CGContextMoveToPoint(context, drawingRect.size.width * CGFloat(progressWidth), CGRectGetHeight(drawingRect)/2);
        CGContextSetStrokeColorWithColor(context, completeColor.CGColor);
        CGContextAddLineToPoint(context, drawingRect.size.width, CGRectGetHeight(drawingRect)/2)
        CGContextStrokePath(context);
        
        let maxTrackImg = UIGraphicsGetImageFromCurrentImageContext()
        
        CGContextMoveToPoint(context, 0, CGRectGetHeight(drawingRect)/2);
        CGContextAddLineToPoint(context, drawingRect.size.width, CGRectGetHeight(drawingRect)/2);
        CGContextSetStrokeColorWithColor(context, valueColor.CGColor);
        CGContextStrokePath(context);
        
        let minTrackImg = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        self.setMinimumTrackImage(minTrackImg, forState: .Normal)
        self.setMaximumTrackImage(maxTrackImg, forState: .Normal)
    }
    
    // MARK: UIAppearance
    @IBInspectable public dynamic var completeColor: UIColor? {
        get { return self._completeColor }
        set { self._completeColor = newValue }
    }
    
    @IBInspectable public dynamic var progressColor: UIColor? {
        get { return self._progressColor }
        set { self._progressColor = newValue }
    }
    
    @IBInspectable public dynamic var valueColor: UIColor? {
        get { return self._valueColor }
        set { self._valueColor = newValue }
    }
}