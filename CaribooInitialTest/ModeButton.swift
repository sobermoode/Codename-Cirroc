//
//  ModeButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/20/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class ModeButton: SKNode {
    
    struct modes {
        static let pictures = "pictures"
        static let words = "words"
    }
    
    enum GameMode: String {
        case pictures, words
    }
    
    var mode: GameMode!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
}
