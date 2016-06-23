# POP-SnapKit
Use SnapKit with the Facebook Pop animation framework. Inspired from [MSSPopMasonry](https://github.com/miklselsoe/MSSPopMasonry)

![](https://github.com/wxxsw/POP-SnapKit/blob/master/screenshot.gif)

## Installation

> **Embedded frameworks require a minimum deployment target of iOS 8.**
>
> To use POP-SnapKit with a project targeting iOS 7, you must to drag `POP+SnapKit.swift` to your iOS Project.

## Use
```Swift
circle.snp_makeConstraints { make in
    self.radiusConstaint = make.width.equalTo(self.radius * 2).constraint
}

let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
spring.toValue = newValue * 2
self.radiusConstaint?.layoutConstraint?.pop_addAnimation(spring, forKey: "someKey")
```

## Dependencies
- [pop](https://github.com/facebook/pop) (1.0.9) - An extensible iOS and OS X animation library, useful for physics-based interactions.
- [SnapKit](https://github.com/SnapKit/SnapKit) (0.21.1) - A Swift Autolayout DSL for iOS & OS X
