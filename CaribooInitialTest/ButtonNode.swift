//
//  ButtonNode.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

protocol ButtonNode {
    func buttonPress(_ pressedButton: SKNode)
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

extension SKSpriteNode: ButtonNode {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
    func buttonPress(_ pressedButton: SKNode) {
        <#code#>
    }
}
