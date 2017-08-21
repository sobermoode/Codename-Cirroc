//
//  ButtonNode.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

public enum ButtonType: String {
    case image, label
    case none
}

public protocol ButtonNode {
    //var isButton: Bool { get set }
    
    func buttonAction()
}

extension ButtonNode {
    public func buttonAction() { }
}

class SKSpriteButton: SKSpriteNode, ButtonNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let _ = touches.first else {
            print("couldn't get the touch...")
            return
        }
        
        buttonAction()
    }
    
    func buttonAction() { }
}
