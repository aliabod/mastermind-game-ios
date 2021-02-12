//
//  ViewController.swift
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 04/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//
//  NOTE TO TESTER: AI SECRET CODE ANSWER IS PRINTED IN OUTPUT

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let maxTries = 10
    var pegCombinations = [PegCombination]()
    
    // computed property for remaining tries
    var remainingTries: Int {
        return maxTries - pegCombinations.count
    }
    // create AI secret code
    var AICombination = PegCombination.randomCombination()
    
    // tries remaining label
    @IBOutlet weak var titleLabel: UILabel!
    // User's typed input
    @IBOutlet weak var userInputView: UserInputView!
    // User's guesses
    @IBOutlet weak var tableView: UITableView!
    // Keyboard Ok button
    @IBOutlet weak var keyboardOkButton: UIButton!

    // View Controller Life Cycle
    // AI SECRET CODE PRINTED FOR TESTING
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        userInputView.mainViewController = self
        updateUI()
        print(AICombination)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // updates tries remaining and clears user's input to allow for another guess
    func updateUI() {
        titleLabel.text = "MASTERMIND  |  TURNS: \(remainingTries)"
        userInputView.clearUserView()
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pegCombinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PegCombinationCell
        let reversedPegCombinations = Array(pegCombinations.reversed())
        let pegCombination = reversedPegCombinations[indexPath.row]
        cell.setupCell(pegCombination: pegCombination)
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    // Keyboard Buttons
    @IBAction func bluePegTapped(_ sender: UIButton) {
        userInputView.appendPeg(colouredPeg: .blue)
    }
    @IBAction func orangePegTapped(_ sender: UIButton) {
        userInputView.appendPeg(colouredPeg: .orange)
    }
    @IBAction func greenPegTapped(_ sender: UIButton) {
        userInputView.appendPeg(colouredPeg: .green)
    }
    @IBAction func redPegTapped(_ sender: UIButton) {
        userInputView.appendPeg(colouredPeg: .red)
    }
    @IBAction func grayPegTapped(_ sender: UIButton) {
        userInputView.appendPeg(colouredPeg: .gray)
    }
    @IBAction func yellowPegTapped(_ sender: UIButton) {
        userInputView.appendPeg(colouredPeg: .yellow)
    }
    @IBAction func deleteTapped(_ sender: UIButton) {
        userInputView.deletePeg()
    }
    @IBAction func okTapped(_ sender: UIButton) {
        let inputPegs = userInputView.colouredPegs
        // Check if user input array has 4 pegs
        guard inputPegs.count == 4 else {
            return
        }
        guard var pegCombination = PegCombination(colouredPegs: inputPegs) else { return }
        // if user guess is correct
        if pegCombination.check(pegCombination: AICombination) {
            UserDefaults.standard.incWinValue()
            show(message: "You Won!", okText: "Restart") {
                // Restart the game
                self.restartGame(nil)
            }
            return
        // if user has no tries remaining
        } else if remainingTries <= 1 {
            UserDefaults.standard.incLossValue()
            show(message: "You Lost!", okText: "Restart") {
                // Restart the game
                self.restartGame(nil)
            }
        }
        // if user has tries remaining
        pegCombinations.append(pegCombination)
        updateUI()
        tableView.reloadData()
    }
    
    // restart button clicked
    @IBAction func restartGame(_ sender: UIButton?) {
        pegCombinations.removeAll()
        AICombination = PegCombination.randomCombination()
        tableView.reloadData()
        updateUI()
        print(AICombination)
    }
    
    // Game win/loss history button tapped
    @IBAction func historyButtonTapped(_ sender: UIButton?) {
        let numberOflosses = UserDefaults.standard.numberOflosses
        let numberOfWins = UserDefaults.standard.numberOfWins
        let message = "Wins: \(numberOfWins)\nLosses: \(numberOflosses)"
        show(message: message, okText: "Ok")
    }
    
    // Whether or not to allow user to click OK button
    func keyboardOkButtonStatus(isEnabled: Bool) {
        keyboardOkButton.isEnabled = isEnabled
    }
    
}


