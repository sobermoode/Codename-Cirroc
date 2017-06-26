//
//  PictureBox.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class PictureBox: SKScene {
    
    var picture: SKSpriteNode!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if let pic = childNode(withName: "picture") as? SKSpriteNode {
            picture = pic
        } else {
            print("Couldn't find the picture sprite for PictureBox", name!)
        }
    }
}
