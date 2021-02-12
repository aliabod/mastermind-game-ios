//
//  PegCombination.swift
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 04/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//

import Foundation

struct PegCombination {
    // Each Peg contains image and colour vars
    let APeg: ColouredPeg
    let BPeg: ColouredPeg
    let CPeg: ColouredPeg
    let DPeg: ColouredPeg
    
    // array containing all pegs
    var pegArray: [ColouredPeg] {
        get {
            return [APeg, BPeg, CPeg, DPeg]
        }
    }
    
    var blackBlob = 0
    var whiteBlob = 0
    
    
    init?(colouredPegs: [ColouredPeg]) {
        guard colouredPegs.count == 4 else {
            return nil
        }
        APeg = colouredPegs[0]
        BPeg = colouredPegs[1]
        CPeg = colouredPegs[2]
        DPeg = colouredPegs[3]
    }
    
    // Algorithm that computes correctness of user's guess
    // Returns a bool to indicate whether player's guess is correct
    mutating func check(pegCombination: PegCombination) -> Bool {
        
        var secretCode: [ColouredPeg?] = pegCombination.pegArray
        var userArray: [ColouredPeg?] = self.pegArray
        
        // Calculates the black blobs
        for index in 0..<4 {
            if self.pegArray[index] == pegCombination.pegArray[index] {
                blackBlob += 1
                secretCode[index] = nil
                userArray[index] = nil
            }
        }
        
        // calculates the white blobs
        for (i1,_) in userArray.enumerated() {
            for (i2,_) in secretCode.enumerated() {
                if userArray[i1] == secretCode[i2], userArray[i1] != nil, secretCode[i2] != nil {
                    whiteBlob+=1
                    secretCode[i2] = nil
                    userArray[i1] = nil
                }
            }
        }
        // returns true if blackBlob is equal to 4, else returns false
        return blackBlob == 4
    }
    
    // function creates a random combination for the AI peg sequence
    static func randomCombination() -> Self {
        return PegCombination(
            colouredPegs: [
                ColouredPeg.randomValue(),
                ColouredPeg.randomValue(),
                ColouredPeg.randomValue(),
                ColouredPeg.randomValue()
            ]
            )!
    }
}
