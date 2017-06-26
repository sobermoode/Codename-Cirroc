//
//  Oscar.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class Oscar: SKSpriteNode {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        run(SKAction.moveTo(x: parent!.frame.minX - (calculateAccumulatedFrame().width / 2), duration: 0.4))
    }
}
