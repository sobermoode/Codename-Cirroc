//
//  ButtonNode.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class ButtonSprite: SKSpriteNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
    
    //open func buttonPress() {}
}

protocol ButtonNode {
    func buttonPress()
}

extension ButtonSprite {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress()
    }
}

extension ButtonSprite: ButtonNode {
    func buttonPress() { }
 }

/*
@objc protocol ButtonNode {
    func buttonPress(_ pressedButton: SKNode)
}

extension ButtonNode {
    
}

enum GameMode: String {
    case pictures, words
}

/*struct GameMode {
    static let pictures = "pictures"
    static let words = "words"
}*/

protocol ModeButton: ButtonNode {
    var mode: GameMode! { get set }
}

/*extension ButtonNode {
    override touches
}*/

extension SKSpriteNode {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //buttonPress(self)
        super.touchesBegan(touches, with: event)
        
        if self is ButtonNode {
            perform(#selector(ButtonNode.buttonPress), with: self)
        }
    }
}
*/
