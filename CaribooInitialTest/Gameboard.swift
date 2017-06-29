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
            if let outer = box.children.first {
                if let pictureBoxNode = outer.children.first {
                    let rando = Int(arc4random_uniform(UInt32(currentThemeNames.count)))
                    let themeName = currentThemeNames.remove(at: rando)
                    let texture = currentThemeTextures.textureNamed(themeName) //SKTexture(imageNamed: PictureBox.currentThemeNames![rando])
                    if let picture = pictureBoxNode.childNode(withName: "picture") as? SKSpriteNode {
                        picture.run(SKAction.setTexture(texture))
                    } else {
                        print("couldn't change the picture for", box.name!)
                    }
                } else {
                    print("couldn't get the pictureBoxNode for", box.name!)
                }
            } else {
                print("couldn't get the outer for", box.name!)
            }
        }
    }
}
