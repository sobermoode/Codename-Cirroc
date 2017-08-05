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
        let playButtonMM = childNode(withName: "playButtonMM") as! MMPlayButton
        let settingsButtonMM = childNode(withName: "settingsButtonMM") as! MMSettingsButton
        
        playButtonMM.delegate = self
        settingsButtonMM.delegate = self
    }
}

extension MainMenu: MMPlayButtonDelegate, MMSettingsButtonDelegate {
    func didPressPlayButtonMM() {
        print("PLAY!!!")
    }
    
    func didPressSettingsButtonMM() {
        print("SETTINGS!!!")
    }
}
