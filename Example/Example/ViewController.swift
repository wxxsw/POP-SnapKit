//
//  ViewController.swift
//  Example
//
//  Created by Gesen on 15/6/8.
//  Copyright (c) 2015年 Gesen. All rights reserved.
//

import UIKit
import pop
import SnapKit

private let MinCircleRadius = CGFloat(50)
private let MaxCircleRadius = CGFloat(150)

class ViewController: UIViewController {
    
    // MARK: Properties
    
    fileprivate let circle = UIButton()
    fileprivate var radiusConstaint: Constraint?
    fileprivate var radius: CGFloat! {
        willSet {
            let constraint = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
            constraint!.springBounciness = 10
            constraint!.toValue = newValue * 2
            self.radiusConstaint?.layoutConstraint?.pop_add(constraint, forKey: "constraint")
            
            let cornerRadius = POPSpringAnimation(propertyNamed: kPOPLayerCornerRadius)
            cornerRadius!.springBounciness = 10
            cornerRadius!.toValue = newValue
            circle.layer.pop_add(cornerRadius, forKey: "cornerRadius")
        }
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        radius = MinCircleRadius
        super.viewDidLoad()
        setupCircle()
        setupLayout()
        changeRadius()
    }
    
    // MARK: Setups
    
    fileprivate func setupCircle() {
        circle.layer.cornerRadius = MinCircleRadius
        circle.backgroundColor = UIColor.white
        circle.addTarget(self, action: #selector(changeRadius), for: .touchUpInside)
        view.addSubview(circle)
    }
    
    fileprivate func setupLayout() {
        circle.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.view)
            self.radiusConstaint = make.width.equalTo(self.radius * 2).constraint
            make.height.equalTo(self.circle.snp.width)
        }
    }
    
    // MARK: Private
    
    @objc fileprivate func changeRadius() {
        radius = (radius == MinCircleRadius ? MaxCircleRadius : MinCircleRadius)
    }
}

