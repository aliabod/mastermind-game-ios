//
//  ColouredPeg.swift
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 04/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//

import UIKit

enum ColouredPeg: CaseIterable {
    case yellow, green, blue, orange, gray, red
    
    // image assigned to each colour case
    var image: UIImage {
        switch self {
        case .yellow:
            return UIImage(named: "yellow")!
        case .green:
            return UIImage(named: "green")!
        case .blue:
            return UIImage(named: "blue")!
        case .orange:
            return UIImage(named: "orange")!
        case .gray:
            return UIImage(named: "grey")!
        case .red:
            return UIImage(named: "red")!
        }
    }
    
    // UIColor colour assigned to each colour case
    var colour: UIColor {
        switch self {
        case .yellow:
            return UIColor.yellow
        case .green:
            return UIColor.green
        case .blue:
            return UIColor.blue
        case .orange:
            return UIColor.orange
        case .gray:
            return UIColor.gray
        case .red:
            return UIColor.red
        }
    }
    
    // function that picks a random case (used to generate AI Secret Code)
    static func randomValue() -> Self {
        return Self.allCases.randomElement()!
    }
}
