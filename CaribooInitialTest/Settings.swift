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
    
    let modes = GameMode.allModes
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
        let modesTableNode = childNode(withName: "modesTableNode")!
        let sceneCenter = scene!.convertPoint(toView: CGPoint.zero)
        let modesTable = UITableView(frame: CGRect(x: sceneCenter.x,
                                                   y: sceneCenter.y,
                                                   width: modesTableNode.calculateAccumulatedFrame().width,
                                                   height: modesTableNode.calculateAccumulatedFrame().height),
                                     style: UITableViewStyle.plain)
        modesTable.backgroundColor = UIColor(red: 194/255, green: 145/255, blue: 0, alpha: 1)
        modesTable.center = sceneCenter
        
        modesTable.dataSource = self
        modesTable.delegate = self
        
        modesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(modesTable)
    }
}

extension Settings: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = UIColor(red: 194/255, green: 145/255, blue: 0, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        label.center = cell.contentView.center
        label.textColor = .white
        label.text = modes[indexPath.row]
        
        cell.contentView.addSubview(label)
        
        return cell
    }
}
