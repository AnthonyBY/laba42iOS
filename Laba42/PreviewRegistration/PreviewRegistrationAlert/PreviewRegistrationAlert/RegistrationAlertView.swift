//
//  RegistrationAlertView.swift
//  Laba42
//
//  Created by chizhavko on 12/18/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import UIKit

class RegistrationAlertView: UIView {
  
  @IBOutlet var containerView: UIView!
  @IBOutlet weak var registrationTitle: UILabel!
  @IBOutlet weak var registrationButtonOutlet: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    commonInit()
    setViewAppearance()
    
  }
  
  @IBAction func registrationButtonAction(_ sender: UIButton) {
    
  }
  
  // Ser view appearance
  private func setViewAppearance() {
    registrationButtonOutlet.layer.cornerRadius = 6
  }
  
  // Initialize custom view
  private func commonInit() {
    Bundle.main.loadNibNamed("RegistrationAlert", owner: self, options: nil)
    addSubview(containerView)
    containerView.frame = bounds
  }
}
