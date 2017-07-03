//
//  DoorButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class DoorButton: SKSpriteNode {
    
    //var doorAction: DoorAction = .none
    //weak var door: SKSpriteNode?
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }
    
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
    func buttonPress(_ pressedButton: SKNode) {
        //print("pressed a door button...")
        //print("parent:", parent!)
        //print("children:", parent!.children)
        //let doorButton = parent!.childNode(withName: "doorButton")!
        //doorButton.alpha = 0
        
        pressedButton.alpha = 0
        
        
        /*door!.run(SKAction.run {
            if let node = self.door!.parent {
                self.door! = SKSpriteNode(texture: nil,
                                          color: UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1),
                                          size: node.calculateAccumulatedFrame().size)
                self.door!.alpha = 1
                self.door!.zPosition = 6
            } else {
                print("couldn't find the parent node...")
            }
        })*/
        
        let door = parent!.childNode(withName: "door") as! SKSpriteNode
        let randoAction = DoorAction.rando(door)
        door.run(randoAction)
        //door!.run(doorAction.rando())
        //door = nil
        //door!.removeFromParent()
        
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
