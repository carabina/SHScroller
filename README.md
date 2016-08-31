# SHScroller

[![CI Status](http://img.shields.io/travis/Sho Miyamoto/SHScroller.svg?style=flat)](https://travis-ci.org/Sho Miyamoto/SHScroller)
[![Version](https://img.shields.io/cocoapods/v/SHScroller.svg?style=flat)](http://cocoapods.org/pods/SHScroller)
[![License](https://img.shields.io/cocoapods/l/SHScroller.svg?style=flat)](http://cocoapods.org/pods/SHScroller)
[![Platform](https://img.shields.io/cocoapods/p/SHScroller.svg?style=flat)](http://cocoapods.org/pods/SHScroller)

## Author
Sho Miyamoto

## Description

**Have you ever thought that you are reluctant to reach out your thumb to change tabs or navigations etc.**
**If so, your users think alike.**
This totally **simple** library provides another secret scroll bar to do it without stretching fingers.


Concretely, this is an invisible view(`UIControl`) on the far right edge.
When users scroll or swipe along the right edge, you can implement a function triggered by users' swiping.


For instance, `UITabBarController`. As you can see the demo video below,
when users swipe down along an invisible scroll bar on the right edge,
the displayed tab is changed to the following tab.
In swiping upward, the previous tab is coming up.



On the Github, there is a demo project, in which a UITabBarController is used as a sample. Check it.


## Requirements

- Swift 2.2
- Xcode 7.3

## Installation

SHScroller is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SHScroller"
```


## Usage
### Initializing
At first initialize SHScroller.

In your `func viewDidLoad()` of `ViewController`, add some lines below.
```swift
let scroller = SHScroller(superView: self.view)

self.view.addSubview(scroller)
```

### Setting a target function triggered by scrolling
Also in `func viewDidLoad()`, add this line.
```swift
scroller.addTarget(self, action: #selector(ViewController.changed), forControlEvents: .ValueChanged)
```
And replace the content of `#selector()` with your function.


### Triggered function
Make associated function designated by `.addTarget()`.
```swift
func changed(scroller: SHScroller) {
    // e.g.
    self.selectedIndex += scroller.delta
}
```
You can access only this property named delta, which can only be read.
Delta takes either 1 (swiping downward) or -1 (upward).


The setup is finished.


### Customizing
In initializing, you can also designate `sensitivity` number and `range` like this.
- `sensitivity: Int` represents the sensitivity of swiping, which is actually how many hit fields will be divided into. The default value is `10`.
- `range: CGFloat` is the horizontally range of hit areas. In the respect of the balance between the performance and less influence to super view, I recommend you keep the default value `15.0` or so.

```swift
let scroller = SHScroller(superView: self.view, sensitivity: 15, range: 20.0)

self.view.addSubview(scroller)
```

## Comments

This is the first time to make OSS, and I started Python this April as the first programming language.
Though this is so simple library, it was very good experience for me.
Please give me any hints, advices, corrections about anything, thank you.


## License

SHScroller is available under the MIT license. See the LICENSE file for more info.
