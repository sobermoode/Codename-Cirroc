//
//  Settings.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/19/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit

class Settings: SKScene {
    
    var previousScene: SKScene!
    var sceneView: SKView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setBackDelegate() {
        let backButton = childNode(withName: "../backButton") as! BackButton
        backButton.delegate = self
    }
}

extension Settings: BackDelegate {
    func dismissScene() {
        sceneView.presentScene(previousScene, transition: SKTransition.moveIn(with: .up, duration: 0.3))
    }
}