//
//  Gameboard.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class Gameboard: SKScene {
    
    override func didMove(to view: SKView) {
        setup()
    }
    
    func setup() {
        let currentThemeTextures = SKTextureAtlas(named: PictureBox.Theme.Animals)
        var currentThemeNames = currentThemeTextures.textureNames
        
        let pictureBoxes = childNode(withName: "pictureBoxes")!.children as! [SKReferenceNode]
        for box in pictureBoxes {
            if let actual = box.actual() {
                let contents = actual.children
                let doorButton = contents[0] as! DoorButton
                let door = contents[1] as! SKSpriteNode
                let picture = contents[2] as! SKSpriteNode
                
                doorButton.door = door
                
                var rando = Int(arc4random_uniform(doorButton.doorAction.maxActions()))
                switch rando {
                    case 0:
                        doorButton.doorAction = .fadeOut
                    case 1:
                        doorButton.doorAction = .slideUp(door: doorButton.door!)
                    case 2:
                        doorButton.doorAction = .starTrek(door: doorButton.door!)
                    default:
                        break
                }
                
                doorButton.alpha = 1
                door.alpha = 1
                
                rando = Int(arc4random_uniform(UInt32(currentThemeNames.count)))
                let themeName = currentThemeNames.remove(at: rando)
                let texture = currentThemeTextures.textureNamed(themeName)
                picture.run(SKAction.setTexture(texture))
            } else {
                print("couldn't get the actual for", box.name!)
            }
        }
        
        let oscar1 = childNode(withName: "oscar1")!
        oscar1.run(SKAction.moveTo(x: frame.minX - (calculateAccumulatedFrame().width / 2), duration: 0.4))
        
        let oscar2 = childNode(withName: "oscar2")!
        oscar2.run(SKAction.fadeOut(withDuration: 0.4))
    }
}
