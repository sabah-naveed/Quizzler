//  Sabah Naveed
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Sabah Naveed on 7/1/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            updateUI()
    }
    
    var quizBrain = QuizBrain()

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if (userGotItRight){
            print("right")
            sender.backgroundColor = UIColor.green
        } else {
            print("wrong")
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQ()
            
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

