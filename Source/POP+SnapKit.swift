//
//  POP+SnapKit.swift
//  POP+SnapKit
//
//  Created by Gesen on 15/6/8.
//  Copyright (c) 2015年 Gesen. All rights reserved.
//
//  POP(1.0.9) + SnapKit(3.0.2)

import Foundation
import pop
import SnapKit

public extension Constraint {
    public var layoutConstraint: LayoutConstraint? {
        return layoutConstraints?.flatMap {
            guard let constraint = _valueForKey(key: "snp.constraint", $0) as? Constraint, constraint === self else { return nil }
            return $0 as? LayoutConstraint
            }.first
    }
    
    public var layoutConstraints: [NSLayoutConstraint]? {
        guard let installInfo = _valueForKey(key: "installInfo", self) as? UIView else { return nil }
        return installInfo.constraints
    }
}

private func _valueForKey(key: String, _ fromObject: AnyObject) -> AnyObject? {
    let ivar = class_getInstanceVariable(type(of: fromObject), key)
    return object_getIvar(fromObject, ivar) as AnyObject?
}
