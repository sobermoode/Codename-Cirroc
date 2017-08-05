//
//  MainMenu.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/24/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    override func didMove(to view: SKView) {
        GameManager.manager.currentScene = self
        
        //let playButton = childNode(withName: "playButton") as! PlayButton
        //let settingsButton = childNode(withName: "settingsButtonMM") as! SettingsButton
        
        //playButton.delegate = self
        //settingsButton.delegate = self
    }
}

/*extension MainMenu: MMPlayButtonDelegate, MMSettingsButtonDelegate {
    func didPressPlayButtonMM() {
        let gameboard = SKScene(fileNamed: "Gameboard") as! Gameboard
        
        GameManager.manager.gameboard = gameboard
        
        view!.presentScene(gameboard)
    }
    
    func didPressSettingsButtonMM() {
        let settingsScene = SKScene(fileNamed: "Settings") as! Settings
        settingsScene.previousScene = self
        settingsScene.sceneView = view!
        settingsScene.setBackDelegate()
        
        view!.presentScene(settingsScene, transition: SKTransition.moveIn(with: .down, duration: 0.3))
    }
}*/
