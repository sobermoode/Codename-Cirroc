//
//  ButtonNode.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

public enum SKButtonType: String {
    case image, label
    case none
}

open class SKButtonNode: SKNode {
    
    /*fileprivate enum SKButtonType: String {
        case image, label
        case none
    }*/
    
    var type: SKButtonType! {
        willSet {
            createNode(buttonType: newValue)
        }
    }
    
    /*override init() {
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
    }*/
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //type = .none
        
        //isUserInteractionEnabled = true
        //name = "SKButtonNode-##"
    }
    
    private func createNode(buttonType type: SKButtonType) {
        switch type {
            case .image:
                let spriteNode = SKSpriteNode(texture: nil, color: .clear, size: CGSize.zero)
                
                addChild(spriteNode)
            case .label:
                let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
                let labelNode = SKLabelNode(fontNamed: defaultFont.fontName)
                //labelNode.text = labelText
                labelNode.verticalAlignmentMode = .center
                
                addChild(labelNode)
            case .none:
                return
        }
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
