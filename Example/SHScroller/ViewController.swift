//
//  ViewController.swift
//  SHScroller
//
//  Created by Sho Miyamoto on 08/30/2016.
//  Copyright (c) 2016 Sho Miyamoto. All rights reserved.
//

import UIKit
import SHScroller

class ViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()

        var viewControllers: [UIViewController] = []

        // Create 5 ViewControllers with different background colors
        for i in 0 ..< 5 {
            let controller = UIViewController()
            controller.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.MostRecent, tag: i)
            controller.view.backgroundColor = UIColor(hue: CGFloat(i)/5, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            viewControllers.append(controller)
        }

        self.setViewControllers(viewControllers, animated: false)



        //MARK: Initializing SHScroller
        let scroller = SHScroller(superView: self.view)

        //MARK: You can also designate sensitivity and range like this.
//        let scroller = SHScroller(superView: self.view, sensitivity: /*Int*/, range: /*CGFloat*/)

        self.view.addSubview(scroller)

        //MARK: Associate your function with SHScroller
        scroller.addTarget(self, action: #selector(ViewController.changed), forControlEvents: .ValueChanged)

    }


    // Associated function
    func changed(scroller: SHScroller) {

        //MARK: You can access only this property named delta, which can only be read.
        //MARK: Delta property takes either 1 or -1
        self.selectedIndex += scroller.delta

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
