//
//  GameManager.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/22/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

struct GameManager {
    
    static var manager = GameManager()
    
    static let defaultTheme: Theme = Themes.animals
    static let defaultMode: Mode = .pictures
    
    var currentCoin: String {
        return "coin" + String(foundCoins)
    }
    
    fileprivate var currentTheme: Theme
    fileprivate var currentMode: Mode
    fileprivate var boxTextures, treasureTextures: SKTextureAtlas
    fileprivate var foundCoins = 0
    
    var previousScene, currentScene: SKScene?
    //fileprivate var activeGame = false
    
    init() {
        currentTheme = GameManager.defaultTheme
        currentMode = GameManager.defaultMode
        boxTextures = SKTextureAtlas(named: currentTheme + "-" + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
    }
    
    /*init(themeName theme: Theme!, modeType mode: Mode!) {
        guard theme != nil && mode != nil else {
            fatalError("init(theme:mode:) cannot be used without supplying a valid theme name!!!")
        }
        
        currentTheme = theme
        currentMode = mode
        boxTextures = SKTextureAtlas(named: currentTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
    }*/
}

extension GameManager {
    func currentTextures() -> (boxTextures: SKTextureAtlas, treasureTextures: SKTextureAtlas) {
        return (boxTextures, treasureTextures)
    }
    
    mutating func play() {
        let gameboard = SKScene(fileNamed: "Gameboard") as! Gameboard
        
        previousScene = currentScene
        currentScene = gameboard
        
        currentScene!.view!.presentScene(gameboard)
    }
    
    mutating func editSettings() {
        let settingsScene = SKScene(fileNamed: "Settings") as! Settings
        //settingsScene.previousScene = currentScene
        //settingsScene.sceneView = currentScene!.view!
        //settingsScene.setBackDelegate()
        
        currentScene!.view!.presentScene(settingsScene, transition: SKTransition.moveIn(with: .down, duration: 0.3))
        
        previousScene = currentScene
        currentScene = settingsScene
    }
    
    mutating func backToPreviousScene() {
        currentScene!.view!.presentScene(previousScene!)
        
        currentScene = previousScene
        previousScene = nil
    }
    
    func updateActiveGame() {
        /// if an active game exists, call after changing the theme or mode, so that the box textures
        /// update in the background, before the user exits the settings screen
    }
    
    mutating func reset() {
        (currentScene as! Gameboard).setup()
        
        foundCoins = 0
    }
    
    mutating func findCoin() {
        foundCoins += 1
    }
    
    mutating func changeTheme(to newTheme: Theme!) {
        guard newTheme != nil else {
            fatalError("changeTheme(to:) cannot be used without supplying a valid theme name!!!")
        }
        
        currentTheme = newTheme
        boxTextures = SKTextureAtlas(named: newTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
        
        /*if let _ = gameboard {
            updateActiveGame()
        }*/
    }
    
    mutating func changeMode(to newMode: Mode!) {
        guard newMode != nil else {
            fatalError("changeMode(to:) cannot be used without supplying a valid mode type!!!")
        }
        
        currentMode = newMode
        boxTextures = SKTextureAtlas(named: currentTheme + currentMode.rawValue)
        treasureTextures = SKTextureAtlas(named: "coins")
        
        /*if let _ = gameboard {
            updateActiveGame()
        }*/
    }
}
