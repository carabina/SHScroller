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
    private var inset: CGFloat!

    //MARK: The number of subviews, namely which represents the sensitivity of change
    private var division: Int!

    // The tag value which is set when touches begin
    private var current: Int = 0

    //MARK: Delta property takes either 1 or -1
    public private(set) var delta: Int = 0


    public init(superView: UIView, division: Int = 10, inset: CGFloat = 15) {

        let frame = CGRect(
            x: superView.bounds.width,
            y: superView.bounds.origin.y,
            width: 0,
            height: superView.bounds.height)

        super.init(frame: frame)

        self.division = division
        self.inset = inset

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
            height: self.bounds.height/CGFloat(division)
        )

        var frame = CGRect(origin: origin, size: size)

        for i in 0 ..< division {

            let bt = ScrollSubView(frame: frame, inset: self.inset, tag: i)
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

        rect.origin.x -= inset
        rect.size.width  += inset

        return CGRectContainsPoint(rect, point)
    }

}

// Views within a ScrollController
private class ScrollSubView: UIView {

    var inset: CGFloat!


    init(frame: CGRect, inset: CGFloat, tag: Int) {
        super.init(frame: frame)
        self.inset = inset
        self.tag = tag
    }


    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {

        var rect: CGRect = self.bounds

        rect.origin.x -= inset
        rect.size.width  += inset

        return CGRectContainsPoint(rect, point)

    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("ScrollSubview init(coder:) has not been implemented")
    }

}
