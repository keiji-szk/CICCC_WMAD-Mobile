//
//  ViewController.swift
//  Apple Pie
//
//  Created by 鈴木啓司 on 2022-04-28.
//

import UIKit

class ViewController: UIViewController {
  
  var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
  let incorrectMovesAllowed = 7
  var totalWins = 0{
    didSet{
      newRound()
    }
  }
  var totalLosses = 0{
    didSet{
      newRound()
    }
  }
  var currentGame: Game!

  @IBOutlet var treeImageView: UIImageView!
  @IBOutlet var correctWordLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var letterButtons: [UIButton]!
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    sender.isEnabled = false
    let letterString = sender.configuration!.title!
    let letter = Character(letterString.lowercased())
    currentGame.playGuessed(letter: letter)
    updateGameState()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newRound()
  }
  
  func newRound(){
    if !listOfWords.isEmpty {
      let newWord = listOfWords.removeFirst()
      currentGame = Game(word: newWord,
      incorrectMovesRemaining: incorrectMovesAllowed,
      guessedLetters: [])
      enableLetterButtons(true)
      updateUI()
    }else {
      enableLetterButtons(false)
    }
  }
  
  func enableLetterButtons(_ enable: Bool){
    for button in letterButtons{
      button.isEnabled = enable
    }
  }
    
  func updateUI() {
    var letters = [String]()
    for letter in currentGame.formattedWord{
      letters.append(String(letter))
    }
    let wordWithSpacing = letters.joined(separator: " ")
    correctWordLabel.text = wordWithSpacing
    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
  }
  
  func updateGameState(){
    if currentGame.incorrectMovesRemaining == 0{
      totalLosses += 1
    }else if currentGame.word == currentGame.formattedWord{
      totalWins += 1
    }else{
      updateUI()
    }
  }
}

