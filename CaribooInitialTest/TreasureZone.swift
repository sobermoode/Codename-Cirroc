//
//  TreasureZone.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/5/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class TreasureZone: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func reset() {
        for number in 1...5 {
            let coin = childNode(withName: "coin" + String(number))!
            coin.run(SKAction.setTexture(SKTexture(imageNamed: "coinGray")))
        }
    }
}
