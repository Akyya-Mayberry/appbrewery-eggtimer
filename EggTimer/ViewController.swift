//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  
  let eggCookingTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
  var count = 0
  var cookTime = 0
  var secondsPassed = 0
  var cookingTimer: Timer?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  
  // MARK: - Methods
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    
    cookingTimer?.invalidate()
    progressView.progress = 0.0
    secondsPassed = 0
    
    if let hardness = sender.currentTitle {
      if let eggTime = eggCookingTimes[hardness] {
        titleLabel.text = hardness
        cookTime = eggTime
        
        cookingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      }
    }
    
  }
  
  @objc func updateTimer() {
    if secondsPassed < cookTime   {
      secondsPassed += 1
      
      let percentageComplete = Float(secondsPassed) / Float(cookTime)
      progressView.progress = percentageComplete
    } else {
      titleLabel.text = "DONE!"
    }
  }
}
