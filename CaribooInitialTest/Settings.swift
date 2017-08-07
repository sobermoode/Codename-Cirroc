//
//  Settings.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/19/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import SpriteKit
import UIKit

class Settings: SKScene {
    
    var modeButtons = [ModeButton]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /*for child in children {
            if child is ModeButton
        }*/
        
        /*let modes = GameMode.allModes
        var modeCounter = 0
        enumerateChildNodes(withName: "CaribooInitialTest.ModeButton") { node, stop in
            let newButton = ModeButton(withLabel: modes[modeCounter])
            node = newButton
        }*/
        
        /*let modesTableNode = childNode(withName: "modesTableNode")!
        let modesTable = UITableView(frame: modesTableNode.calculateAccumulatedFrame(), style: UITableViewStyle.plain)
        view!.addSubview(modesTable)*/
    }
}
