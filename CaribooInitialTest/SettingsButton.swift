//
//  SettingsButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/19/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class SettingsButton: SKSpriteNode {
    
    var delegate: SettingsDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
}

extension SettingsButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}

extension SettingsButton: ButtonNode {
    func buttonPress(_ pressedButton: SKNode) {
        guard let delegate = delegate else {
            print("the SettingsDelegate isn't set!!!")
            return
        }
        
        delegate.didPressSettingsButton()
    }
}

protocol SettingsDelegate {
    func didPressSettingsButton()
}
