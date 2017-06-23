//
//  NextLetterButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class NextLetterButton: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
}

extension NextLetterButton: ButtonNode {
    func buttonPress(_ pressedButton: ButtonNode) {
        print("pressing the button!!!")
    }
}

extension NextLetterButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}
