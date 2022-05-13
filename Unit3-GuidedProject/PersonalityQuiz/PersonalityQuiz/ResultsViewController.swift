//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by 鈴木啓司 on 2022-05-07.
//

import UIKit

class ResultsViewController: UIViewController {
  
  @IBOutlet var resultAnswerLabel: UILabel!
  @IBOutlet var resultDefinitionLabel: UILabel!
  var responses: [Answer]
  

  override func viewDidLoad() {
    super.viewDidLoad()
    calculatePersonalityResult()
    navigationItem.hidesBackButton = true
  }
  
  func calculatePersonalityResult() {
    let frequencyOfAnswers = responses.reduce(into: [:]) {
      (counts, answer) in
      counts[answer.type, default: 0] += 1
    }
    
    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
    
    
    resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.definition

    
//    let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
//    { (pair1, pair2) in
//        return pair1.value > pair2.value
//    })
//    let mostCommonAnswer = frequentAnswersSorted.first!.key
//
  }
  
  init?(coder: NSCoder, responses: [Answer]){
    self.responses = responses
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}
