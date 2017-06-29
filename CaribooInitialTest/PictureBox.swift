//
//  PictureBox.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class PictureBox: SKScene {
    
    //static var didNotStartInit = true
    
    struct Theme {
        static let Animals = "animals" /*[String] = SKTextureAtlas(named: "animals").textureNames*/ /*["arcticFox",
                              "chicken",
                              "cow",
                              "dog",
                              "duck",
                              "elephant",
                              "fish",
                              "horse",
                              "kitten"]*/
    }
    
    //static var currentSet: [String]?
    //fileprivate var editingIsNotAllowed = true
    //static var currentThemeNames: [String]?
    //static var currentThemeTextures: SKTextureAtlas?
    
    var pictureBoxNode: PictureBoxNode?
    var picture: SKSpriteNode?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if let pcboxNode = childNode(withName: "PictureBoxNode") as? PictureBoxNode {
            //print("pcboxNode:", pcboxNode, "\n")
            pictureBoxNode = pcboxNode
            if let boxPic = pcboxNode.childNode(withName: "picture") as? SKSpriteNode {
                //print("boxPic:", boxPic)
                picture = boxPic
            }
        }
    }
    
    /*static func setupForThemeName(_ name: String) {
        //print("setup...")
        let currentThemeTextures = SKTextureAtlas(named: name)
        var currentThemeNames = currentThemeTextures.textureNames
        
        repeat {
            print("count:", currentThemeNames.count, "\n")
            let rando = Int(arc4random_uniform(UInt32(currentThemeNames.count)))
            let picture = self.childNode("picture")! as! SKSpriteNode
            let themeName = currentThemeNames.remove(at: rando)
            let texture = PictureBox.currentThemeTextures!.textureNamed(themeName) //SKTexture(imageNamed: PictureBox.currentThemeNames![rando])
            print("rando:", rando.description, "\npicture:", picture.description, "\ntexture:", texture.description, "\n")
            
            picture.run(SKAction.setTexture(texture))
            
            //PictureBox.currentThemeNames!.remove(at: rando)
        } while PictureBox.currentThemeNames!.count != 0
    }*/
    
    /*static func newCurrentTheme(_ theme: String) {
        PictureBox.currentThemeTextures = SKTextureAtlas(named: theme)
        PictureBox.currentThemeNames = PictureBox.currentThemeTextures!.textureNames
    }*/
    
    /*required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /*if PictureBox.didNotStartInit {
            print("STARTING INIT\n\n")
            PictureBox.currentSet = PictureBox.Themes.Animals
            PictureBox.didNotStartInit = false
        }
        
        if PictureBox.currentSet.count == 0 {
            print("\n\nINIT END")
            PictureBox.currentSet = [String]()
            PictureBox.didNotStartInit = true
            return
        }*/
        
        /*if PictureBox.tempTheme == nil {
            //PictureBox.currentSet = [String]()
            PictureBox.tempTheme = Themes.Animals
            print("\n")
        }*/
        
        guard PictureBox.currentThemeNames != nil else {
            fatalError("something went wrong with the PictureBox.currentTheme...")
        }
        
        repeat {
            print("count:", PictureBox.currentThemeNames!.count, "\n")
            let rando = Int(arc4random_uniform(UInt32(PictureBox.currentThemeNames!.count)))
            let picture = childNode(withName: "picture") as! SKSpriteNode
            let themeName = PictureBox.currentThemeNames!.remove(at: rando)
            let texture = PictureBox.currentThemeTextures!.textureNamed(themeName) //SKTexture(imageNamed: PictureBox.currentThemeNames![rando])
            print("rando:", rando.description, "\npicture:", picture.description, "\ntexture:", texture.description, "\n")
            
            picture.run(SKAction.setTexture(texture))
            
            //PictureBox.currentThemeNames!.remove(at: rando)
        } while PictureBox.currentThemeNames!.count != 0
        
        //PictureBox.currentSet = nil
        PictureBox.currentThemeNames = nil
        PictureBox.currentThemeTextures = nil
        print("\n")
        
        /*var total = UInt32(Themes.Animals.count - 1)
        while total <= 0 {
            let rando = Int(arc4random_uniform(total))
            let picture = childNode(withName: "picture") as! SKSpriteNode
            let texture = SKTexture(imageNamed: PictureBox.currentSet[rando])
            //print("rando:", rando.description, "picture:", picture.description, "texture:", texture.description)
            picture.run(SKAction.setTexture(texture))
            total -= 1
        }*/
        
        
        
        /*print(String(PictureBox.currentSet.count), "\n")
        let rando = Int(arc4random_uniform(UInt32(PictureBox.currentSet.count)))
        let picture = childNode(withName: "picture") as! SKSpriteNode
        let texture = SKTexture(imageNamed: PictureBox.currentSet[rando])
        print("rando:", rando.description, "picture:", picture.description, "texture:", texture.description)
        picture.run(SKAction.setTexture(texture))
        PictureBox.currentSet.remove(at: rando)*/
    }*/
}
