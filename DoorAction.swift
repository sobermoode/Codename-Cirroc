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
            sender.run(SKAction.fadeOut(withDuration: 0.4))
        }
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
            
            sender.parent!.addChild(leftSide)
            sender.parent!.addChild(rightSide)
            
            sender.alpha = 0
            sender.parent!.childNode(withName: "leftSide")!.alpha = 1
            sender.parent!.childNode(withName: "rightSide")!.alpha = 1
            sender.parent!.childNode(withName: "leftSide")!.run(SKAction.scaleX(to: 0, duration: 0.4))
            sender.parent!.childNode(withName: "rightSide")!.run(SKAction.scaleX(to: 0, duration: 0.4)) {
                sender.removeFromParent()
            }
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
}
