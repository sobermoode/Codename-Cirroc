//
//  Modes.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 7/20/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import Foundation

enum GameMode: String {
    case pictures, words
    
    static var allModes: [String] {
        return ["pictures", "words"]
    }
}
