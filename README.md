# POP-SnapKit
Use SnapKit with the Facebook Pop animation framework. Inspired from [MSSPopMasonry](https://github.com/miklselsoe/MSSPopMasonry)

## Installation
Open your project in Xcode, then drag 'POP+SnapKit.swift' onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.

## Use
```Swift
circle.snp_makeConstraints { make in
    self.radiusConstaint = make.width.equalTo(self.radius * 2)
}

let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
spring.toValue = newValue * 2
self.radiusConstaint?.layoutConstraint?.pop_addAnimation(spring, forKey: "someKey")
```

## Dependencies
- [pop](https://github.com/facebook/pop) (1.0.7) - An extensible iOS and OS X animation library, useful for physics-based interactions.
- [SnapKit](https://github.com/SnapKit/SnapKit) (0.13.0) - A Swift Autolayout DSL for iOS & OS X
