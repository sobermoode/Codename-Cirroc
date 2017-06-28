//
//  PictureBox.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class PictureBox: SKScene {
    
    struct Themes {
        static let Animals = ["arcticFox",
                              "chicken",
                              "cow",
                              "dog",
                              "duck",
                              "elephant",
                              "fish",
                              "horse",
                              "kitten"]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let rando = Int(arc4random_uniform(UInt32(Themes.Animals.count)))
        let picture = childNode(withName: "picture") as! SKSpriteNode
        picture.run(SKAction.setTexture(SKTexture(imageNamed: Themes.Animals[rando])))
    }
}
