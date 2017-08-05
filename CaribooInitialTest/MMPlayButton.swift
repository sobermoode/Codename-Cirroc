//
//  MMPlayButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/24/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class MMPlayButton: SKSpriteNode {
    
    var delegate: MMPlayButtonDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
}

extension MMPlayButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}

extension MMPlayButton: ButtonNode {
    func buttonPress(_ pressedButton: SKNode) {
        guard let delegate = delegate else {
            print("the SettingsDelegate isn't set!!!")
            return
        }
        
        delegate.didPressPlayButtonMM()
    }
}

protocol MMPlayButtonDelegate {
    func didPressPlayButtonMM()
}
