# SHScroller

[![CI Status](http://img.shields.io/travis/Sho Miyamoto/SHScroller.svg?style=flat)](https://travis-ci.org/Sho Miyamoto/SHScroller)
[![Version](https://img.shields.io/cocoapods/v/SHScroller.svg?style=flat)](http://cocoapods.org/pods/SHScroller)
[![License](https://img.shields.io/cocoapods/l/SHScroller.svg?style=flat)](http://cocoapods.org/pods/SHScroller)
[![Platform](https://img.shields.io/cocoapods/p/SHScroller.svg?style=flat)](http://cocoapods.org/pods/SHScroller)

## Description

Have you ever thought that you are reluctant to reach out your thumb to change tabs or navigations etc.
If so, your users think alike.
This totally simple library provides another secret scroll bar to do it without any stretching fingers.


Concretely, this is an invisible view(`UIControl`) on the far right edge.
When users scroll or swipe along the right edge, you can implement a function triggered by users' swiping.


For instance, `UITabBarController`. As you can see the demo video below,
when users swipe down along an invisible scroll bar on the right edge,
the displayed tab is changed to the following tab.
In swiping upward, the previous tab is coming up.



On the Github, there is a demo project, in which a UITabBarController is used as a sample. Check it.


## Requirements

Swift 2.2
Xcode 7.3

## Installation

SHScroller is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SHScroller"
```

## Author

Sho Miyamoto

## License

SHScroller is available under the MIT license. See the LICENSE file for more info.
