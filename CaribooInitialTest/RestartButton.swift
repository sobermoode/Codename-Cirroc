//
//  StartButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class RestartButton: SKButtonNode {
    
    override func buttonPress() {
        GameManager.manager.reset()
    }
}
