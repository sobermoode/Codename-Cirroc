//
//  BackButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/19/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class BackButton: SKSpriteButton {
    
    override func buttonAction() {
        GameManager.manager.backToPreviousScene()
    }
}
