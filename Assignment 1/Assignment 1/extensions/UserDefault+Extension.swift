//
//  UserDefault.swift
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 09/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//

import Foundation


extension UserDefaults {
    // Keys for score count
    enum keys {
        static let winKey = "winKey"
        static let loseKey = "loseKey"
    }
    // Computed property for wins
    var numberOfWins: Int {
        get {
            if let winValue = UserDefaults.standard.value(forKey: UserDefaults.keys.winKey) as? Int {
                return winValue
            // if winValue has no value
            } else {
                UserDefaults.standard.setValue(0, forKey: UserDefaults.keys.winKey)
                return 0
            }
        // sets the number of wins
        } set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaults.keys.winKey)
        }
    }
    // Computed property for losses
    var numberOflosses: Int {
        get {
            if let winValue = UserDefaults.standard.value(forKey: UserDefaults.keys.loseKey) as? Int {
                return winValue
            } else {
                UserDefaults.standard.setValue(0, forKey: UserDefaults.keys.loseKey)
                return 0
            }
        } set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaults.keys.loseKey)
        }
    }
    // functions called to inc win or loss count
    func incWinValue() {
        let newValue = numberOfWins + 1
        numberOfWins = newValue
    }
    
    func incLossValue() {
        let newValue = numberOflosses + 1
        numberOflosses = newValue
    }
}
