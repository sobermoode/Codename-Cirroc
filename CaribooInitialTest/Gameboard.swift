//
//  Gameboard.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class Gameboard: SKScene {
    
    var themeName: String!
    var currentThemeTextures, coinTextures: SKTextureAtlas!
    
    override func didMove(to view: SKView) {
        guard themeName != nil else {
            fatalError("The themeName isn't set!!!")
        }
        
        setup()
    }
    
    func setup() {
        guard themeName != nil else {
            fatalError("The themeName isn't set!!!")
        }
        
        preloadImages()
        createPictureBoxes()
    }
    
    private func preloadImages() {
        currentThemeTextures = SKTextureAtlas(named: themeName!)
        coinTextures = SKTextureAtlas(named: "coins")
    }
    
    private func placeCoins() {
        var pictureBoxes = childNode(withName: "pictureBoxes")!.children as! [SKReferenceNode]
        var remainingCoins = 5
        
        while remainingCoins > 0 {
            let rando = Int(arc4random_uniform(UInt32(pictureBoxes.count)))
            let box = pictureBoxes[rando]
            if arc4random_uniform(UInt32(2)) == 1 {
                box.childNode(withName: "coin")!.run(SKAction.setTexture(SKTexture(imageNamed: "coin")))
                remainingCoins -= 1
                pictureBoxes.remove(at: rando)
            }
        }
    }
    
    private func createPictureBoxes() {
        var textureNames = currentThemeTextures.textureNames
        let pictureBoxes = childNode(withName: "pictureBoxes")!.children as! [SKReferenceNode]
        for box in pictureBoxes {
            if let newPictureBox = SKScene(fileNamed: "PictureBox") as? PictureBox {
                box.removeAllChildren()
                
                for child in newPictureBox.children {
                    let newChild = child.copy() as! SKNode
                    child.removeFromParent()
                    box.addChild(newChild)
                }
                
                let rando = Int(arc4random_uniform(UInt32(textureNames.count)))
                let textureName = textureNames.remove(at: rando)
                let texture = currentThemeTextures.textureNamed(textureName)
                box.childNode(withName: "picture")!.run(SKAction.setTexture(texture))
            } else {
                print("couldn't reset the picture box.")
            }
        }
        
        placeCoins()
        
        let oscar1 = childNode(withName: "oscar1")!
        oscar1.run(SKAction.moveTo(x: frame.minX - (calculateAccumulatedFrame().width / 2), duration: 0.4))
        
        let oscar2 = childNode(withName: "oscar2")!
        oscar2.run(SKAction.fadeOut(withDuration: 0.4))
    }
}
