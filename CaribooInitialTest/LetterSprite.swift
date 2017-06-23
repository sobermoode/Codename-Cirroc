//
//  LetterSprite.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class LetterSprite: SKSpriteNode {
    
    static let lettersAtlas = SKTextureAtlas(named: "letters")
    
    init(_ letter: Character) {
        let letterTexture = LetterSprite.lettersAtlas.textureNamed(String(letter))
        
        super.init(texture: letterTexture,
                   color: .clear,
                   size: CGSize(width: letterTexture.size().width,
                                height: letterTexture.size().height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
