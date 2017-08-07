//
//  ModeButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/20/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class ModeButton: SKButtonNode {
    
    override init() {
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var mode: GameMode!
    
    override func buttonPress() {
        print("buttonPress()...")
    }
}

