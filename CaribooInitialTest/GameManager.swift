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
    
    static let defaultTheme = GameTheme.animals
    static let defaultMode = GameMode.pictures
    
    var currentDevice: UIUserInterfaceIdiom!
    var previousScene, currentScene: SKScene?
    var currentCoin: String {
        return "coin" + String(foundCoins)
    }
    var allModes: SKTextureAtlas {
        return SKTextureAtlas(named: "modes")
    }
    
    fileprivate var currentTheme: String
    fileprivate var currentMode: String
    fileprivate var boxTextures, treasureTextures: SKTextureAtlas
    fileprivate var modesTextures: SKTextureAtlas
    fileprivate var foundCoins = 0
    
    init() {
        currentTheme = GameManager.defaultTheme
        currentMode = GameManager.defaultMode
        boxTextures = SKTextureAtlas(named: currentTheme + "-" + currentMode)
        treasureTextures = SKTextureAtlas(named: "coins")
        modesTextures = SKTextureAtlas(named: "modes")
    }
}

extension GameManager {
    
    func currentTextures() -> (boxTextures: SKTextureAtlas, treasureTextures: SKTextureAtlas) {
        return (boxTextures, treasureTextures)
    }
    
    mutating func play() {
        let gameboard = SKScene(fileNamed: "Gameboard") as! Gameboard
        gameboard.scaleMode = (currentDevice == .phone) ? .aspectFill : .aspectFit
        
        currentScene!.view!.presentScene(gameboard)
        
        currentScene = gameboard
    }
    
    mutating func editSettings() {
        let settingsScene = SKScene(fileNamed: "Settings") as! Settings
        settingsScene.scaleMode = (currentDevice == .phone) ? .aspectFill : .aspectFit
        
        currentScene!.view!.presentScene(settingsScene, transition: SKTransition.moveIn(with: .down, duration: 0.3))
        if currentScene!.name == "Gameboard" {
            (currentScene as! Gameboard).didLeave = true
        }
        
        previousScene = currentScene
        currentScene = settingsScene
    }
    
    mutating func backToPreviousScene() {
        currentScene!.view!.presentScene(previousScene!)
        
        currentScene = previousScene
        previousScene = nil
    }
    
    func updateActiveGame() {
        if previousScene!.name == "Gameboard" {
            (previousScene as! Gameboard).updateWithNewMode(currentMode)
        }
    }
    
    mutating func reset() {
        (currentScene as! Gameboard).setup()
        
        foundCoins = 0
    }
    
    mutating func findCoin() {
        foundCoins += 1
    }
    
    mutating func changeTheme(to newTheme: String!) {
        guard newTheme != nil else {
            fatalError("Don't forget about a valid theme!!! :: changeTheme(to:)")
        }
        
        currentTheme = newTheme
        boxTextures = SKTextureAtlas(named: newTheme + currentMode)
        treasureTextures = SKTextureAtlas(named: "coins")
    }
    
    mutating func changeMode(to newMode: String!) {
        guard newMode != nil else {
            fatalError("Don't forget about a valid mode type!!! :: changeMode(to:)")
        }
        
        currentMode = newMode
        boxTextures = SKTextureAtlas(named: currentTheme + "-" + currentMode)
        treasureTextures = SKTextureAtlas(named: "coins")
        
        if previousScene!.name == "Gameboard" {
            (previousScene as! Gameboard).theNewMode = newMode
        }
    }
}
