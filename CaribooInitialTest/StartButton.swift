//
//  StartButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class StartButton: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
}

extension StartButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}

extension StartButton: ButtonNode {
    func buttonPress(_ pressedButton: ButtonNode) {
        if let cover = scene!.childNode(withName: "cover") {
            cover.removeFromParent()
        }
        
        run(SKAction.setTexture(SKTexture(imageNamed: "restartButton")))
    }
}
