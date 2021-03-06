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
    
    let modes = GameManager.manager.allModes
    var modesTable: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
        let modesTableNode = childNode(withName: "modesTableNode")!
        let sceneCenter = scene!.convertPoint(toView: CGPoint.zero)
        modesTable = UITableView(frame: CGRect(x: sceneCenter.x,
                                               y: sceneCenter.y,
                                               width: modesTableNode.calculateAccumulatedFrame().width,
                                               height: modesTableNode.calculateAccumulatedFrame().height),
                                 style: UITableViewStyle.plain)
        modesTable.backgroundColor = UIColor(red: 194/255, green: 145/255, blue: 0, alpha: 1)
        modesTable.center = sceneCenter
        
        modesTable.dataSource = self
        modesTable.delegate = self
        
        let nib = UINib(nibName: "ModeCell", bundle: Bundle.main)
        modesTable.register(nib, forCellReuseIdentifier: "modeCell")
        
        view.addSubview(modesTable)
    }
    
    override func willMove(from view: SKView) {
        modesTable.removeFromSuperview()
    }
}

extension Settings: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modes.textureNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modeCell") as! ModeCell
        cell.backgroundColor = UIColor(red: 194/255, green: 145/255, blue: 0, alpha: 1)
        let mode = modes.textureNames[indexPath.row]
        let modeTexture = modes.textureNamed(mode)
        cell.modeImage.image = UIImage(cgImage: modeTexture.cgImage())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var mode = modes.textureNames[indexPath.row]
        mode = mode.components(separatedBy: ".").first!
        GameManager.manager.changeMode(to: mode)
    }
}
