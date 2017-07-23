//
//  GameManager.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/22/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

struct GameManager {
    
    fileprivate var defaultTheme: Theme = Themes.animals
    fileprivate var defaultMode: Mode = .pictures
    
    fileprivate var currentTheme: Theme
    fileprivate var currentMode: Mode
    fileprivate var boxTextures, treasureTextures: SKTextureAtlas
    fileprivate var foundCoins = 0
    
    fileprivate var activeGame = false
    
    init() {
        currentTheme = defaultTheme
        currentMode = defaultMode
        boxTextures = SKTextureAtlas(named: currentTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
    }
    
    init(themeName theme: Theme!, modeType mode: Mode!) {
        guard theme != nil && mode != nil else {
            fatalError("init(theme:mode:) cannot be used without supplying a valid theme name!!!")
        }
        
        currentTheme = theme
        currentMode = mode
        boxTextures = SKTextureAtlas(named: currentTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
    }
}

extension GameManager {
    func currentTextures() -> (boxTextures: SKTextureAtlas, treasureTextures: SKTextureAtlas) {
        return (boxTextures, treasureTextures)
    }
    
    func updateActiveGame() {
        /// if an active game exists, call after changing the theme or mode, so that the box textures
        /// update in the background, before the user exits the settings screen
    }
    
    mutating func changeTheme(to newTheme: Theme!) {
        guard newTheme != nil else {
            fatalError("changeTheme(to:) cannot be used without supplying a valid theme name!!!")
        }
        
        currentTheme = newTheme
        boxTextures = SKTextureAtlas(named: newTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
        
        if activeGame {
            updateActiveGame()
        }
    }
    
    mutating func changeMode(to newMode: Mode!) {
        guard newMode != nil else {
            fatalError("changeMode(to:) cannot be used without supplying a valid mode type!!!")
        }
        
        currentMode = newMode
        boxTextures = SKTextureAtlas(named: currentTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
        
        if activeGame {
            updateActiveGame()
        }
    }
}
