//
//  DoorAction.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/2/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

struct DoorAction {
    static func fadeOut(_ sender: SKSpriteNode) -> SKAction {
        return SKAction.run {
            //node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            sender.run(SKAction.fadeOut(withDuration: 0.4))
        }
        //return SKAction.fadeOut(withDuration: 0.4)
    }
    
    static func slideUp(_ sender: SKSpriteNode) -> SKAction {
        return SKAction.run {
            sender.anchorPoint = CGPoint(x: 0.5, y: 1)
            sender.position.y += sender.calculateAccumulatedFrame().height / 2
            sender.run(SKAction.scaleY(to: 0, duration: 0.4))
        }
    }
    
    static func starTrek(_ sender: SKSpriteNode) -> SKAction {
        return SKAction.run {
            print("star trek")
            let color = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
            //let lColor = UIColor.blue
            //let rColor = UIColor.green
            let leftSide = SKSpriteNode(texture: nil,
                                        color: color,
                                        size: CGSize(width: sender.calculateAccumulatedFrame().width / 2,
                                                     height: sender.calculateAccumulatedFrame().height))
            let rightSide = SKSpriteNode(texture: nil,
                                         color: color,
                                         size: CGSize(width: sender.calculateAccumulatedFrame().width / 2,
                                                      height: sender.calculateAccumulatedFrame().height))
            leftSide.anchorPoint = CGPoint(x: 0, y: 0.5)
            leftSide.name = "leftSide"
            leftSide.position.x -= sender.calculateAccumulatedFrame().width / 2
            leftSide.zPosition = 20
            rightSide.anchorPoint = CGPoint(x: 1, y: 0.5)
            rightSide.name = "rightSide"
            rightSide.position.x += sender.calculateAccumulatedFrame().width / 2
            rightSide.zPosition = 20
            
            //let halfSlide = SKAction.scaleX(to: 0, duration: 0.4)
            //let open = SKAction.group([sender.childNode(withName: "leftSide")!.run(halfSlide), sender.childNode(withName: "rightSide")!.run(halfSlide)])
            
            sender.parent!.addChild(leftSide)
            sender.parent!.addChild(rightSide)
            
            sender.alpha = 0
            sender.parent!.childNode(withName: "leftSide")!.alpha = 1
            sender.parent!.childNode(withName: "rightSide")!.alpha = 1
            sender.parent!.childNode(withName: "leftSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
            sender.parent!.childNode(withName: "rightSide")!.run(SKAction.scaleX(to: 0, duration: 0.4)) {
                //sender.removeFromParent()
            }
            
            /*sender.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                          SKAction.run { sender.removeFromParent() } ]))*/
            //sender.removeFromParent()
            //sender.childNode(withName: "leftSide")!.removeFromParent()
            //sender.childNode(withName: "rightSide")!.removeFromParent()
        }
    }
    
    static let maxActions = UInt32(3)
    
    static func rando(_ sender: SKSpriteNode) -> SKAction {
        var action = SKAction()
        
        switch Int(arc4random_uniform(maxActions)) {
            case 0:
                action = DoorAction.fadeOut(sender)
            
            case 1:
                action = DoorAction.slideUp(sender)
            
            case 2:
                action = DoorAction.starTrek(sender)
            
            default:
                break
        }
        
        return action
    }
    
    /*static func rando(_ sender: SKSpriteNode) -> SKAction {
        print("rando()...")
        var action = SKAction()
        
        var rando = Int(arc4random_uniform(maxActions))
        switch rando {
        case 0:
            action = SKAction.fadeOut(withDuration: 0.4)
            
        case 1:
            action = SKAction.run {
                print("slide up")
                sender.anchorPoint = CGPoint(x: 0.5, y: 1)
                sender.position.y += sender.calculateAccumulatedFrame().height / 2
                sender.run(SKAction.scaleY(to: 0, duration: 0.4))
            }
            
        case 2:
            action = SKAction.run {
                print("star trek")
                let color = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
                let leftSide = SKSpriteNode(texture: nil,
                                            color: color,
                                            size: CGSize(width: sender.calculateAccumulatedFrame().width / 2,
                                                         height: sender.calculateAccumulatedFrame().height))
                let rightSide = SKSpriteNode(texture: nil,
                                             color: color,
                                             size: CGSize(width: sender.calculateAccumulatedFrame().width / 2,
                                                          height: sender.calculateAccumulatedFrame().height))
                leftSide.anchorPoint = CGPoint(x: 0, y: 0.5)
                leftSide.name = "leftSide"
                leftSide.position.x -= sender.calculateAccumulatedFrame().width / 2
                leftSide.zPosition = 20
                rightSide.anchorPoint = CGPoint(x: 1, y: 0.5)
                rightSide.name = "rightSide"
                rightSide.position.x += sender.calculateAccumulatedFrame().width / 2
                rightSide.zPosition = 20
                
                sender.addChild(leftSide)
                sender.addChild(rightSide)
                
                sender.childNode(withName: "leftSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                sender.childNode(withName: "rightSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                sender.childNode(withName: "leftSide")!.removeFromParent()
                sender.childNode(withName: "rightSide")!.removeFromParent()
                
                /*if let actual = door.parent {
                    actual.addChild(leftSide)
                    actual.addChild(rightSide)
                    
                    door.alpha = 0
                    actual.childNode(withName: "leftSide")!.alpha = 1
                    actual.childNode(withName: "rightSide")!.alpha = 1
                    
                    actual.childNode(withName: "leftSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                    actual.childNode(withName: "rightSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                    actual.childNode(withName: "leftSide")!.removeFromParent()
                    actual.childNode(withName: "rightSide")!.removeFromParent()
                }*/
            }
            
        default:
            break
        }
        
        switch self {
        case .fadeOut:
            action = SKAction.fadeOut(withDuration: 0.4)
            
        case .slideUp(let door):
            action = SKAction.run {
                print("slide up")
                door.anchorPoint = CGPoint(x: 0.5, y: 1)
                door.position.y += door.calculateAccumulatedFrame().height / 2
                door.run(SKAction.scaleY(to: 0, duration: 0.4))
            }
            
        case .starTrek(let door):
            action = SKAction.run {
                print("star trek")
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
                leftSide.position.x -= door.calculateAccumulatedFrame().width / 2
                leftSide.zPosition = 20
                rightSide.anchorPoint = CGPoint(x: 1, y: 0.5)
                rightSide.name = "rightSide"
                rightSide.position.x += door.calculateAccumulatedFrame().width / 2
                rightSide.zPosition = 20
                
                if let actual = door.parent {
                    actual.addChild(leftSide)
                    actual.addChild(rightSide)
                    
                    door.alpha = 0
                    actual.childNode(withName: "leftSide")!.alpha = 1
                    actual.childNode(withName: "rightSide")!.alpha = 1
                    
                    actual.childNode(withName: "leftSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                    actual.childNode(withName: "rightSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
                    actual.childNode(withName: "leftSide")!.removeFromParent()
                    actual.childNode(withName: "rightSide")!.removeFromParent()
                }
            }
            
        case .none:
            break
        }
        
        return action*/
}
