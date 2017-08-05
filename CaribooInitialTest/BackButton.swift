//
//  BackButton.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/19/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class BackButton: ButtonSprite {
    
    /*var delegate: BackDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }*/
    
    override func buttonPress() {
        GameManager.manager.backToPreviousScene()
    }
}

/*extension BackButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}

extension BackButton: ButtonNode {
    func buttonPress(_ pressedButton: SKNode) {        
        guard let delegate = delegate else {
            print("the BackDelegate isn't set!!!")
            return
        }
        
        delegate.dismissScene()
    }
}

protocol BackDelegate {
    func dismissScene()
}*/
