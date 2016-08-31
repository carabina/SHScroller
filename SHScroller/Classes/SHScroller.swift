//
//  ScrollController.swift
//  ScrollController
//
//  Created by Sho Miyamoto on 2016/08/30.
//  Copyright © 2016年 Sho Miyamoto. All rights reserved.
//

import Foundation
import UIKit


public class SHScroller: UIControl {
    
    
    //MARK: The width of hit area
    private var range: CGFloat!
    
    
    //MARK: The number of subviews, namely which represents the sensitivity of change
    private var sensitivity: Int!
    
    
    // The tag value which is set when touches begin
    private var current: Int = 0
    
    
    //MARK: Delta property takes either 1 or -1
    public private(set) var delta: Int = 0
    
    
    
    public init(superView: UIView, sensitivity: Int = 10, range: CGFloat = 15.0) {
        
        let frame = CGRect(
            x: superView.bounds.width,
            y: superView.bounds.origin.y,
            width: 0,
            height: superView.bounds.height)
        
        super.init(frame: frame)
        
        
        if 2 <= sensitivity && sensitivity <= 30 {
            self.sensitivity = sensitivity
        } else {
            print("The value of sensitivity is replaced with default 10, because required value is from 2 to 30.")
            self.sensitivity = 10
        }
        
        
        if 1 <= range && range <= 50 {
            self.range = range
        } else {
            print("The value of range is replaced with default 15.0, because required value is from 1 to 50.")
            self.range = 15.0
        }
        
        
        
        setup()
        
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("ScrollController init(coder:) has not been implemented")
    }
    
    
    
    // Make some fields which can detect touches
    private func setup() {
        
        let origin = self.bounds.origin
        
        let size = CGSize(
            width: self.bounds.width,
            height: self.bounds.height/CGFloat(sensitivity)
        )
        
        var frame = CGRect(origin: origin, size: size)
        
        for i in 0 ..< sensitivity {
            
            let bt = ScrollSubView(frame: frame, range: self.range, tag: i)
            self.addSubview(bt)
            frame = frame.offsetBy(dx: 0, dy: frame.height)
            
        }
    }
    
    
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        if let view = self.hitView(touches, withEvent: event) {
            self.current = view.tag
        }
        
    }
    
    
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        if let view = self.hitView(touches, withEvent: event) {
            
            if self.current != view.tag {
                
                self.delta = view.tag - self.current
                self.current = view.tag
                self.sendActionsForControlEvents(.ValueChanged)
            }
        }
    }
    
    
    
    private func hitView(touches: Set<NSObject>, withEvent event: UIEvent?) -> ScrollSubView? {
        
        if let touch = touches.first as? UITouch {
            if let hitView = self.hitTest(touch.locationInView(self), withEvent:  event) as? ScrollSubView {
                return hitView
            }
        }
        return nil
    }
    
    
    // Expand the hit area
    override public func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        
        var rect: CGRect = self.bounds
        
        rect.origin.x -= range
        rect.size.width  += range
        
        return CGRectContainsPoint(rect, point)
    }
    
}

// Views within a ScrollController
private class ScrollSubView: UIView {
    
    var range: CGFloat!
    
    
    init(frame: CGRect, range: CGFloat, tag: Int) {
        super.init(frame: frame)
        self.range = range
        self.tag = tag
    }
    
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        
        var rect: CGRect = self.bounds
        
        rect.origin.x -= range
        rect.size.width  += range
        
        return CGRectContainsPoint(rect, point)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ScrollSubview init(coder:) has not been implemented")
    }
    
}
