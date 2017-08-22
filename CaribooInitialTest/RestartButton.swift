//
//  StartButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class RestartButton: SKSpriteButton {
    
    override func buttonAction() {
        GameManager.manager.reset()
    }
}

