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
        //var mutableBoxes = pictureBoxes as [AnyObject]
        for box in pictureBoxes {
            if let newPictureBox = SKScene(fileNamed: "PictureBox") {
                //print("newPictureBox:", newPictureBox)
                //print("children:", newPictureBox.children)
                box.removeAllChildren() //newPictureBox as? PictureBox
                for child in newPictureBox.children {
                    let newChild = child.copy() as! SKNode
                    child.removeFromParent()
                    // newChild.alpha = 1
                    box.addChild(newChild)
                }
            } else {
                print("couldn't reset the box.")
            }
        }
        
            /*if let actual = box.actual() {
                //let contents = actual.children
                let doorButton = actual.childNode(withName: "doorButton") as! DoorButton //contents[0] as! DoorButton
                let door = actual.childNode(withName: "door") as! SKSpriteNode //contents[1] as! SKSpriteNode
                //print("door:", door)
                let picture = actual.childNode(withName: "picture") as! SKSpriteNode //contents[2] as! SKSpriteNode
                
                doorButton.door = nil
                door.removeFromParent()
                
                let newDoor = SKSpriteNode(texture: nil,
                                    color: UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1),
                                    size: actual.calculateAccumulatedFrame().size)
                newDoor.alpha = 1
                newDoor.name = "door"
                newDoor.zPosition = 6
                
                doorButton.alpha = 1
                doorButton.zPosition = 7
                doorButton.door = newDoor
                
                actual.insertChild(newDoor, at: 1)
                print("actual.door zPosition:", actual.childNode(withName: "door")!.zPosition)
                print("actual.doorButton zPosition:", actual.childNode(withName: "doorButton")!.zPosition)
                
                //print("newDoor:", newDoor)
                //print("doorButton.door:", doorButton.door!)
                
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
                
                //doorButton.alpha = 1
                //door.alpha = 1
                
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
        oscar2.run(SKAction.fadeOut(withDuration: 0.4))*/
    }
}
