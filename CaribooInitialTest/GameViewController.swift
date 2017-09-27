//
//  GameViewController.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 6/21/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let mainMenu = SKScene(fileNamed: "MainMenu") as? MainMenu {
                // Set the scale mode to scale to fit the window
                if UIDevice.current.userInterfaceIdiom == .phone {
                    GameManager.manager.currentDevice = .phone
                    mainMenu.scaleMode = .aspectFill
                } else if UIDevice.current.userInterfaceIdiom == .pad {
                    GameManager.manager.currentDevice = .pad
                    mainMenu.scaleMode = .aspectFit
                }
                
                // Present the scene
                view.presentScene(mainMenu)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
