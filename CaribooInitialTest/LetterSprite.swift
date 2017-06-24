//
//  LetterSprite.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/23/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit
import Foundation

class LetterSprite: SKSpriteNode {
    
    static let lettersAtlas = SKTextureAtlas(named: "letters")
    
    struct Codepoints {
        static let minCodepoint = UInt32(97)
        static let maxCodepoint = UInt32(122)
    }
    
    init?(_ letter: Character) {
        let letterIndex = String(letter).lowercased().utf16.startIndex
        let codeUnit = String(letter).utf16[letterIndex]
        if let scalar = UnicodeScalar(codeUnit) {
            guard CharacterSet.lowercaseLetters.contains(scalar) else {
                return nil
            }
        }
        
        let letterTexture = LetterSprite.lettersAtlas.textureNamed(String(letter))
        
        super.init(texture: letterTexture,
                   color: .clear,
                   size: CGSize(width: letterTexture.size().width,
                                height: letterTexture.size().height))
        
        name = String(letter)
        zPosition = 5
    }
    
    convenience init() {
        let rando = UnicodeScalar(arc4random_uniform(LetterSprite.Codepoints.maxCodepoint - LetterSprite.Codepoints.minCodepoint) + LetterSprite.Codepoints.minCodepoint)!
        let randoChar = Character(rando)
        
        self.init(randoChar)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
