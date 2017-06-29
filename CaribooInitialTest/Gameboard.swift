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
                if let picture = actual.childNode(withName: "picture") as? SKSpriteNode {
                    let rando = Int(arc4random_uniform(UInt32(currentThemeNames.count)))
                    let themeName = currentThemeNames.remove(at: rando)
                    let texture = currentThemeTextures.textureNamed(themeName)
                    
                    picture.run(SKAction.setTexture(texture))
                } else {
                    print("couldn't get the picture for", box.name!)
                }
            } else {
                print("couldn't get the actual for", box.name!)
            }
        }
    }
}
