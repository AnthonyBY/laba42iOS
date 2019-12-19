//
//  LaunchScreenFake.swift
//  Laba42
//
//  Created by chizhavko on 12/17/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import UIKit

class LaunchScreenFake: UIViewController {
  @IBOutlet weak var firstLine: UIView!
  @IBOutlet weak var secondLine: UIView!
  @IBOutlet weak var thirdLine: UIView!
  
  @IBOutlet weak var firstTextLabel: UILabel!
  @IBOutlet weak var secondTextLabel: UILabel!
  @IBOutlet weak var thirdTextLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setStartAppearance()
    animateView(on: firstTextLabel, delayAfter: 0.5)
    animateView(on: firstLine, delayAfter: 0.5)
    animateView(on: secondTextLabel, remove: firstLine, delayAfter: 1.0)
    animateView(on: secondLine, delayAfter: 1.0)
    animateView(on: thirdTextLabel, remove: secondLine, delayAfter: 1.5)
    animateView(on: thirdLine, delayAfter: 1.5)
  }
  
  // Appear view
  func animateView(on label: UIView, remove: UIView =  UIView(), delayAfter: Double) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delayAfter) {
      remove.alpha = 0
      label.alpha = 1
    }
  }
  
  // Set start appearance for elements
  func setStartAppearance() {
    firstLine.alpha = 0
    secondLine.alpha = 0
    thirdLine.alpha = 0
    
    firstTextLabel.alpha = 0
    secondTextLabel.alpha = 0
    thirdTextLabel.alpha = 0
  }
}
