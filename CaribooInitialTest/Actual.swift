//
//  Actual.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/29/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

extension SKReferenceNode {
    func actual() -> SKNode? {
        var actual: SKNode?
        
        if let child = children.first {
            actual = child
        } else {
            actual = nil
        }
        
        return actual
    }
}
