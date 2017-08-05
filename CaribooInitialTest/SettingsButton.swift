//
//  SettingsButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/19/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class SettingsButton: ButtonSprite {
    
    //var delegate: SettingsDelegate!
    
    override func buttonPress() {
        GameManager.manager.editSettings()
    }
}

/*extension SettingsButton: ButtonNode {
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
}*/
