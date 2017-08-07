//
//  ButtonNode.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

open class SKButtonNode: SKNode {
    
    fileprivate enum SKButtonType: String {
        case image, label
        case none
    }
    
    fileprivate var type: SKButtonType!
    
    override init() {
        super.init()
    }
    
    convenience init(withImage imageName: String) {
        self.init()
        
        type = .image
        isUserInteractionEnabled = true
        
        let spriteNode = SKSpriteNode(imageNamed: imageName)
        
        addChild(spriteNode)
    }
    
    convenience init(withLabel labelText: String) {
        self.init()
        
        type = .label
        isUserInteractionEnabled = true
        
        let labelNode = SKLabelNode(fontNamed: "Avenir-Next")
        labelNode.text = labelText
        labelNode.verticalAlignmentMode = .center
        
        addChild(labelNode)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        type = .none
        isUserInteractionEnabled = true
    }
}

public protocol ButtonNode {
    func buttonPress()
}

extension SKButtonNode {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress()
    }
}

extension SKButtonNode: ButtonNode {
    public func buttonPress() { }
}
