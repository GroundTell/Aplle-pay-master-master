//
//  ViewController.swift
//  Aplle pay
//
//  Created by student on 29.03.2018.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var correctWorldlabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
    var listofwords = [
        "Анастасия",
        "Анна",
        "Мария"
    ]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLoses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound() {
        let newWord = listofwords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, gusessedLetters: [])
        
            updateUI()
    }
    
    func updateUI() {
        let name = "Tree \(currentGame.incorrectMovesRemaining)"
        imageView.image = UIImage(named: name)
        
        correctWorldlabel.text = currentGame.formattedWord
        
        scoreLabel.text = "Выигрыши: \(totalWins), Проигрыши: \(totalLoses)"
    }
}
