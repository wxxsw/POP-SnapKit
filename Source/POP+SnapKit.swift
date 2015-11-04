//
//  POP+SnapKit.swift
//  POP+SnapKit
//
//  Created by Gesen on 15/6/8.
//  Copyright (c) 2015年 Gesen. All rights reserved.
//
//  POP(1.0.8) + SnapKit(0.16.0)

import Foundation
import pop
import SnapKit

extension Constraint {
    
    var layoutConstraint: LayoutConstraint? {
        for layoutConstraint in gs_layoutConstraints() {
            if let constraint = gs_valueForKey("snp_constraint", layoutConstraint) as? Constraint {
                if self === constraint {
                    return layoutConstraint as? LayoutConstraint
                }
            }
        }
        return nil
    }
    
    private func gs_layoutConstraints() -> [AnyObject] {
        let installInfo = gs_valueForKey("installInfo", self) as! UIView
        return installInfo.constraints
    }
    
}

private func gs_valueForKey(key: String, _ fromObject: AnyObject) -> AnyObject? {
    let ivar = class_getInstanceVariable(fromObject.dynamicType, key)
    return object_getIvar(fromObject, ivar)
}
