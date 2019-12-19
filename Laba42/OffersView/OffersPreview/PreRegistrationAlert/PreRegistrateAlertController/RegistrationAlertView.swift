//
//  RegistrationAlertView.swift
//  Laba42
//
//  Created by chizhavko on 12/18/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import UIKit

class PreRegistrationAlertView: UIView {

  @IBOutlet weak var registrationTitle: UILabel!
  @IBOutlet weak var registrationButtonOutlet: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setViewAppearance()
  }
  
  @IBAction func registrationButtonAction(_ sender: UIButton) {
    
  }
  
  
  private func setViewAppearance() {
    registrationButtonOutlet.layer.cornerRadius = 6
    
  }

}
