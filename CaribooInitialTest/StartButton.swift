//
//  StartButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class StartButton: SKSpriteNode {
    
    enum Mode: String {
        case startMode, restartMode
    }
    
    var mode = Mode(rawValue: "startMode")!
    
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
    func buttonPress(_ pressedButton: SKNode) {
        switch mode {
            case .startMode:
                if let cover = scene!.childNode(withName: "cover") {
                    //cover.removeFromParent()
                    cover.alpha = 0
                    cover.isUserInteractionEnabled = false
                }
                
                zPosition = 2
                run(SKAction.setTexture(SKTexture(imageNamed: "restartButton")))
                
                mode = .restartMode
                
            case .restartMode:
                (scene as! Gameboard).setup()
        }
    }
}
