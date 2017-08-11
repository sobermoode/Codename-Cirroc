//
//  Modes.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/20/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import Foundation

struct GameMode {
    
    static let pictures = "pictures"
    static let words = "words"
    
    static var allModes: [String] {
        return [GameMode.pictures,
                GameMode.words]
    }
    
}
