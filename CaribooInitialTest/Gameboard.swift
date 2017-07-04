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
            if let newPictureBox = SKScene(fileNamed: "PictureBox") {
                box.removeAllChildren()
                
                for child in newPictureBox.children {
                    let newChild = child.copy() as! SKNode
                    child.removeFromParent()
                    box.addChild(newChild)
                }
                
                let rando = Int(arc4random_uniform(UInt32(currentThemeNames.count)))
                let themeName = currentThemeNames.remove(at: rando)
                let texture = currentThemeTextures.textureNamed(themeName)
                box.childNode(withName: "picture")!.run(SKAction.setTexture(texture))
            } else {
                print("couldn't reset the box.")
            }
        }
        
        let oscar1 = childNode(withName: "oscar1")!
        oscar1.run(SKAction.moveTo(x: frame.minX - (calculateAccumulatedFrame().width / 2), duration: 0.4))
        
        let oscar2 = childNode(withName: "oscar2")!
        oscar2.run(SKAction.fadeOut(withDuration: 0.4))
    }
}
