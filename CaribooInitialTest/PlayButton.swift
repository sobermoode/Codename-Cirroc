//
//  MMPlayButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/24/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class PlayButton: SKButtonNode {
    
    override func buttonPress() {
        GameManager.manager.play()
    }
}
