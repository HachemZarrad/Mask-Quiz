//
//  ScoreViewController.swift
//  Mask-Game
//
//  Created by Hachem Zarrad on 11/4/2022.
//

import UIKit

class ScoreViewController: UIViewController {
	@IBOutlet weak var scoreLabel: UILabel!
	
	var score: Int?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		scoreLabel.text = "\(score ?? 0)/22"
		// Do any additional setup after loading the view.
	}
	
	
	@IBAction func retakeQuizPressed(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func exitAppPressed(_ sender: UIButton) {
		DispatchQueue.main.asyncAfter(deadline: .now()) {
			UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
			DispatchQueue.main.asyncAfter(deadline: .now()) {
				exit(0)
			}
		}
	}
	
}
