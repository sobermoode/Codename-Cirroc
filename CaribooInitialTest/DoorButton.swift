//
//  DoorButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class DoorButton: ButtonSprite {
    
    /*override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }*/
    
    override func buttonPress() {
        self.alpha = 0
        
        let pictureBox = parent!
        let picture = pictureBox.childNode(withName: "picture") as! SKSpriteNode
        picture.run(DoorAction.fadeToGray(picture))
        
        let coin = pictureBox.childNode(withName: "coin") as! SKSpriteNode
        if coin.texture != nil {
            let gameboard = parent!.parent!.scene as! Gameboard
            gameboard.findCoinAtPictureBox(pictureBox.name!)
        }
        
        let rando = arc4random_uniform(10) + 1
        if rando < 3 || rando == 10 {
            let pictureBoxScene = parent!
            let gameboardScene = pictureBoxScene.scene!
            
            var oscar = Oscar()
            switch rando {
            case 1:
                fallthrough
            case 2:
                oscar = gameboardScene.childNode(withName: "oscar1") as! Oscar
                oscar.isUserInteractionEnabled = true
                oscar.type = .type1
                oscar.run(SKAction.moveTo(x: gameboardScene.frame.midX, duration: 0.4))
                
            case 10:
                oscar = gameboardScene.childNode(withName: "oscar2") as! Oscar
                oscar.isUserInteractionEnabled = true
                oscar.type = .type2
                oscar.run(SKAction.fadeIn(withDuration: 0.4))
                oscar.run(SKAction.repeatForever(SKAction.sequence([SKAction.setTexture(SKTexture(imageNamed: "oscar2-2")),
                                                                    SKAction.wait(forDuration: 0.4),
                                                                    SKAction.setTexture(SKTexture(imageNamed: "oscar2-1")),
                                                                    SKAction.wait(forDuration: 0.4)])))
            default:
                break
            }
        }
    }
}

/*
extension DoorButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}
 */

/*
extension DoorButton: ButtonNode {
    func buttonPress(_ pressedButton: SKNode) {
        pressedButton.alpha = 0
        
        let pictureBox = parent!
        let picture = pictureBox.childNode(withName: "picture") as! SKSpriteNode
        picture.run(DoorAction.fadeToGray(picture))
        
        let coin = pictureBox.childNode(withName: "coin") as! SKSpriteNode
        if coin.texture != nil {
            let gameboard = parent!.parent!.scene as! Gameboard
            gameboard.findCoinAtPictureBox(pictureBox.name!)
        }
        
        let rando = arc4random_uniform(10) + 1
        if rando < 3 || rando == 10 {
            let pictureBoxScene = parent!
            let gameboardScene = pictureBoxScene.scene!
            
            var oscar = Oscar()
            switch rando {
                case 1:
                    fallthrough
                case 2:
                    oscar = gameboardScene.childNode(withName: "oscar1") as! Oscar
                    oscar.isUserInteractionEnabled = true
                    oscar.type = .type1
                    oscar.run(SKAction.moveTo(x: gameboardScene.frame.midX, duration: 0.4))
                
                case 10:
                    oscar = gameboardScene.childNode(withName: "oscar2") as! Oscar
                    oscar.isUserInteractionEnabled = true
                    oscar.type = .type2
                    oscar.run(SKAction.fadeIn(withDuration: 0.4))
                    oscar.run(SKAction.repeatForever(SKAction.sequence([SKAction.setTexture(SKTexture(imageNamed: "oscar2-2")),
                                                                        SKAction.wait(forDuration: 0.4),
                                                                        SKAction.setTexture(SKTexture(imageNamed: "oscar2-1")),
                                                                        SKAction.wait(forDuration: 0.4)])))
                default:
                    break
            }
        }
    }
}
 */
