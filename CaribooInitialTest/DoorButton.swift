//
//  DoorButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class DoorButton: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
}

extension DoorButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}

extension DoorButton: ButtonNode {
    func buttonPress(_ pressedButton: ButtonNode) {
        let doorButton = parent!.childNode(withName: "doorButton")!
        doorButton.alpha = 0
        
        let door = parent!.childNode(withName: "door")!
        door.run(SKAction.fadeOut(withDuration: 0.2))
        
        let rando = arc4random_uniform(10) + 1
        if rando < 3 {
            let pictureBoxScene = parent!
            let gameboardScene = pictureBoxScene.scene!
            let oscar = gameboardScene.childNode(withName: "./oscar")!
            oscar.isUserInteractionEnabled = true
            oscar.run(SKAction.moveTo(x: gameboardScene.frame.midX, duration: 0.4))
        }
    }
}
