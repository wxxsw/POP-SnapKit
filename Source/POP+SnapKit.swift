//
//  POP+SnapKit.swift
//  POP+SnapKit
//
//  Created by Gesen on 15/6/8.
//  Copyright (c) 2015年 Gesen. All rights reserved.
//
//  POP(1.0.7) + SnapKit(0.12.0)

import Foundation
import pop
import SnapKit

private struct ConcreteConstraintInstallInfo {
    
    weak var view: View? = nil
    let layoutConstraints: NSHashTable
    
}

extension Constraint {
    
    var layoutConstraint: LayoutConstraint? {
        for layoutConstraint in layoutConstraints() {
            if let constraint = valueForKey("snp_constraint", layoutConstraint) as? Constraint {
                if self === constraint {
                    return layoutConstraint as? LayoutConstraint
                }
            }
        }
        return nil
    }
    
    func layoutConstraints() -> [AnyObject] {
        let anyobject: AnyObject = valueForKey("installInfo", self)
        let installInfo = valueForKey("installInfo", self) as! UIView
        return installInfo.constraints()
    }
}

func valueForKey(key: String, fromObject: AnyObject) -> AnyObject {
    let ivar = class_getInstanceVariable(fromObject.dynamicType, key)
    return object_getIvar(fromObject, ivar)
}
