//
//  Gameboard.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/27/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class Gameboard: SKScene {
    
    var boxTextures = SKTextureAtlas()
    var treasureTextures = SKTextureAtlas()
    var starParticles: SKEmitterNode!
    var didLeave = false
    var theNewMode: String?
    
    override func didMove(to view: SKView) {
        if let newMode = theNewMode {
            updateWithNewMode(newMode)
            theNewMode = nil
        }
        
        if didLeave {
            didLeave = false
        } else {
            setup()
        }
    }
    
    func updateWithNewMode(_ newMode: String) {
        let newBoxTextures = GameManager.manager.currentTextures().boxTextures
        let pictureBoxes = childNode(withName: "pictureBoxes")!.children as! [SKReferenceNode]
        
        for box in pictureBoxes {
            let newTextureName = box.name! + "-" + newMode + ".png"
            let newTexture = newBoxTextures.textureNamed(newTextureName)
            box.childNode(withName: "picture")!.run(SKAction.setTexture(newTexture))
        }
    }
    
    func setup() {
        (boxTextures, treasureTextures) = GameManager.manager.currentTextures()
        
        createPictureBoxes()
        resetTreasureZone()
        
        if let emitterReference = childNode(withName: "starParticles") as? SKReferenceNode {
            if let emitter = emitterReference.actual() as? SKEmitterNode {
                starParticles = emitter
            } else {
                print("couldn't get the emitter actual...")
            }
        } else {
            print("couldn't get the star particles reference node...")
        }
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
        
        for box in pictureBoxes {
            box.childNode(withName: "coin")!.alpha = 0
        }
    }
    
    private func createPictureBoxes() {
        var textureNames = boxTextures.textureNames
        let pictureBoxes = childNode(withName: "pictureBoxes")!.children as! [SKReferenceNode]
        for box in pictureBoxes {
            if let newPictureBox = SKScene(fileNamed: "PictureBox") as? PictureBox {
                box.removeAllChildren()
                
                for child in newPictureBox.children {
                    let newChild = child.copy() as! SKNode
                    newChild.name = child.name!
                    child.removeFromParent()
                    box.addChild(newChild)
                }
                
                let rando = Int(arc4random_uniform(UInt32(textureNames.count)))
                let textureName = textureNames.remove(at: rando)
                let texture = boxTextures.textureNamed(textureName)
                box.childNode(withName: "picture")!.run(SKAction.setTexture(texture))
                box.name = textureName.components(separatedBy: "-").first!
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
    
    private func resetTreasureZone() {
        let treasureZone = childNode(withName: "treasureZone") as! SKReferenceNode
        
        if let actual = treasureZone.actual() {
            for number in 1...5 {
                let coin = actual.childNode(withName: "coin" + String(number))!
                coin.run(SKAction.setTexture(SKTexture(imageNamed: "coinGray")))
            }
        } else {
            print("couldn't reset the treasure zone.")
        }
    }
    
    func findCoinAtPictureBox(_ pictureBoxName: String) {
        let clearCover = SKSpriteNode(texture: nil, color: .clear, size: UIScreen.main.bounds.size)
        clearCover.zPosition = 50
        addChild(clearCover)
        
        let pictureBox = childNode(withName: "//" + pictureBoxName)!
        let coin = pictureBox.childNode(withName: "coin")!
        coin.alpha = 1
        coin.zPosition = 51
        
        GameManager.manager.findCoin()
        
        let emitterPosition = convert(pictureBox.position, from: pictureBox.parent!)
        let emitter = SKEmitterNode(fileNamed: "StarParticles.sks")!
        emitter.position = emitterPosition
        emitter.particleBirthRate = 150
        addChild(emitter)
        emitter.advanceSimulationTime(1)
        
        var destination = CGPoint.zero
        var moveToDestination = SKAction.move(to: convert(destination, to: pictureBox), duration: 1.5)
        var spin = SKAction.rotate(byAngle: CGFloat(GLKMathDegreesToRadians(360)), duration: 1.5)
        let grow = SKAction.scale(by: 2, duration: 0.3)
        let shrink = grow.reversed()
        var coinAction = SKAction.sequence([SKAction.group([moveToDestination, spin]), grow, shrink])
        
        coin.run(coinAction) {
            let currentCoinName = GameManager.manager.currentCoin
            let currentCoinSprite = self.childNode(withName: "//" + currentCoinName)!
            
            destination = self.convert(currentCoinSprite.position, from: currentCoinSprite.parent!)
            moveToDestination = SKAction.move(to: self.convert(destination, to: pictureBox), duration: 1.5)
            spin = SKAction.rotate(byAngle: CGFloat(GLKMathDegreesToRadians(720)), duration: 1.5)
            coinAction = SKAction.group([moveToDestination, spin])
            
            coin.run(coinAction) {
                currentCoinSprite.run(SKAction.setTexture(SKTexture(imageNamed: currentCoinName)))
                coin.removeFromParent()
                clearCover.removeFromParent()
                emitter.removeFromParent()
            }
        }
    }
}
