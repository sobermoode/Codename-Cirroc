//
//  GameManager.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/22/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

struct GameManager {
    
    private var defaultTheme: Theme = Themes.animals
    
    var currentTheme: Theme
    var themeTextures, treasureTextures: SKTextureAtlas
    var foundCoins = 0
    
    init(with themeName: Theme? = nil) {
        currentTheme = (themeName != nil) ? themeName! : defaultTheme
        themeTextures = SKTextureAtlas(named: currentTheme)
        treasureTextures = SKTextureAtlas(named: "coins")
    }
    
    mutating func changeTheme(to newTheme: Theme) {
        currentTheme = newTheme
        themeTextures = SKTextureAtlas(named: currentTheme)
        treasureTextures = SKTextureAtlas(named: "coins")
    }
}
