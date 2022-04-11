//
//  ViewController.swift
//  Mask-Game
//
//  Created by Hachem Zarrad on 11/4/2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scoreLabel: UILabel!
	
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var suggestion1: UIButton!
	
	@IBOutlet weak var suggestion2: UIButton!
	
	@IBOutlet weak var suggestion3: UIButton!
	
	@IBOutlet weak var progressBar: UIProgressView!
	
	@IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
	
	var quizBrain = QuizBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.translatesAutoresizingMaskIntoConstraints = false
		updateUI()
	}
	
	@IBAction func answerButtonPressed(_ sender: UIButton) {
		
		finalizeQuizz(progress: quizBrain.getProgress())
		
		let userAnswer = sender.currentTitle!
		let userGotItRight = quizBrain.checkAnswer(userAnswer)
		
		if userGotItRight { sender.backgroundColor = UIColor.green }
		else { sender.backgroundColor = UIColor.red }
		
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
	}
	
	@objc func updateUI() {
		
		
		questionLabel.text = quizBrain.getQuestionText()
		progressBar.progress = quizBrain.getProgress()
		
		suggestion1.setTitle(quizBrain.getFirstSuggestion(), for: .normal)
		suggestion2.setTitle(quizBrain.getSecondSuggestion(), for: .normal)
		
		let thirdSuggestion = quizBrain.getThirdSuggestion()
		if thirdSuggestion == "" {
			switchConstraint(constraintToChange: &topViewHeightConstraint, multiplier: 0.6)
			suggestion3.isHidden = true
		}else {
			suggestion3.isHidden = false
			switchConstraint(constraintToChange: &topViewHeightConstraint, multiplier: 0.4)
			suggestion3.setTitle(thirdSuggestion, for: .normal)
		}
	
		
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		
		suggestion1.backgroundColor = UIColor.clear
		suggestion2.backgroundColor = UIColor.clear
		suggestion3.backgroundColor = UIColor.clear
		
	}
	
	func finalizeQuizz(progress: Float) {
		if progress == 1.0 {
			performSegue(withIdentifier: "getScore", sender: self)
		}
	}
	
	func switchConstraint(constraintToChange: inout NSLayoutConstraint, multiplier: CGFloat) {
		let newConstraint = constraintToChange.constraintWithMultiplier(multiplier)
		view.removeConstraint(constraintToChange)
		view.addConstraint(newConstraint)
		view.layoutIfNeeded()
		constraintToChange.isActive = false
		constraintToChange = newConstraint
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "getScore" {
			let destinationVC = segue.destination as! ScoreViewController
			destinationVC.score = quizBrain.getScore()
		}
	}
	
}

extension NSLayoutConstraint {
	func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
		return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
	}


}

