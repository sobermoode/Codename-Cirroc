//
//  Oscar.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/26/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class Oscar: SKSpriteNode {
    
    enum OscarType: Int {
        case type1, type2
    }
    
    var type: OscarType!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch type! {
            case .type1:
                run(SKAction.moveTo(x: parent!.frame.minX - (calculateAccumulatedFrame().width / 2), duration: 0.4))
            
            case .type2:
                run(SKAction.fadeOut(withDuration: 0.4))
        }
    }
}
