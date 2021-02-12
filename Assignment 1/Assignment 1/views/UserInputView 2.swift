//
//  UserInputView.swift
//  View that shows user their input
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 04/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//

import UIKit

class UserInputView: UIView {
    // user's typed input pegs are put into an array
    var colouredPegs = [ColouredPeg]()
    weak var mainViewController: MainViewController?
    
    // views of user's typed input pegs
     @IBOutlet weak var APegImageView: UIImageView!
     @IBOutlet weak var BPegImageView: UIImageView!
     @IBOutlet weak var CPegImageView: UIImageView!
     @IBOutlet weak var DPegImageView: UIImageView!
    
    // appends a peg to user's typed input array
    func appendPeg(colouredPeg: ColouredPeg) {
        guard colouredPegs.count < 4 else {
            return
        }
        colouredPegs.append(colouredPeg)
        updateUserView()
        return
    }
    
    // deletes last peg in user's typed input array
    func deletePeg() {
        guard !colouredPegs.isEmpty else {
            return
        }
        colouredPegs.removeLast()
        updateUserView()
    }
    
    // function that updates views
    func updateUserView() {
        let count = colouredPegs.count
        let emptyImage = #imageLiteral(resourceName: "emptyPeg")
        let firstColouredPeg = count > 0 ? colouredPegs[0] : nil
        let secondColouredPeg = count > 1 ? colouredPegs[1] : nil
        let thirdColouredPeg = count > 2 ? colouredPegs[2] : nil
        let fourthColouredPeg = count > 3 ? colouredPegs[3] : nil
        APegImageView.image = firstColouredPeg?.image ?? emptyImage
        BPegImageView.image = secondColouredPeg?.image ?? emptyImage
        CPegImageView.image = thirdColouredPeg?.image ?? emptyImage
        DPegImageView.image = fourthColouredPeg?.image ?? emptyImage
        mainViewController?.keyboardOkButtonStatus(isEnabled: count == 4)
    }
    
    // resets user's input
    func clearUserView() {
        colouredPegs.removeAll()
        updateUserView()
    }
}

