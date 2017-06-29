//
//  PictureBoxNode.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/28/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class PictureBoxNode: SKNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupWithThemeName(_ name: String) {
        let picture = childNode(withName: "picture") as! SKSpriteNode
        picture.run(SKAction.setTexture(SKTexture(imageNamed: "name")))
    }

}
