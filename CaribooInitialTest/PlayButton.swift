//
//  MMPlayButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/24/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class PlayButton: SKSpriteButton {
    
    override func buttonAction() {
        //print("pressed the play button!!!")
        GameManager.manager.play()
    }
}
