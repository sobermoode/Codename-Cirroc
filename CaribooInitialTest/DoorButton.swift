//
//  DoorButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class DoorButton: SKSpriteNode {
    
    enum DoorAction {
        case none
        case fadeOut, slideUp(door: SKSpriteNode), starTrek(door: SKSpriteNode)
        
        func maxActions() -> UInt32 {
            return 2
        }
        
        func rando() -> SKAction {
            var action = SKAction()
            //let randoC = arc4random_uniform(2)
            //let door = SKAction.perform(#selector("door()"), onTarget: )
            
            switch self {
                case .fadeOut:
                    action = SKAction.fadeOut(withDuration: 0.4)
                
                case .slideUp(let door):
                    action = SKAction.run {
                        door.anchorPoint = CGPoint(x: 0.5, y: 1)
                        door.run(SKAction.scaleY(to: 0, duration: 0.4))
                    }
                
                case .starTrek(let door):
                    action = SKAction.run {
                        let color = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
                        let leftSide = SKSpriteNode(texture: nil,
                                                    color: color,
                                                    size: CGSize(width: door.calculateAccumulatedFrame().width / 2,
                                                                 height: door.calculateAccumulatedFrame().height))
                        let rightSide = SKSpriteNode(texture: nil,
                                                    color: color,
                                                    size: CGSize(width: door.calculateAccumulatedFrame().width / 2,
                                                                 height: door.calculateAccumulatedFrame().height))
                        leftSide.anchorPoint = CGPoint(x: 0, y: 0.5)
                        leftSide.name = "leftSide"
                        rightSide.anchorPoint = CGPoint(x: 1, y: 0.5)
                        rightSide.name = "rightSide"
                        
                        door.addChild(leftSide)
                        door.addChild(rightSide)
                        
                        /// turn door invisible here
                        door.alpha = 0
                        door.childNode(withName: "leftSide")!.alpha = 1
                        door.childNode(withName: "rightSide")!.alpha = 1
                        
                        door.childNode(withName: "leftSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                        door.childNode(withName: "rightSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                    }
                
                case .none:
                    break
            }
            
            return action
        }
    }
    
    var doorAction: DoorAction = .none
    weak var door: SKSpriteNode?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
    
    /*func door() -> SKNode? {
        var door: SKNode?
        
        if let actualDoor = parent!.childNode(withName: "door") {
            door = actualDoor
        } else {
            door = nil
        }
        
        return door
    }*/
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
        
        //tempDoor = parent!.childNode(withName: "door") as? SKSpriteNode
        //door.run(SKAction.fadeOut(withDuration: 0.2))
        door!.run(doorAction.rando())
        
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
