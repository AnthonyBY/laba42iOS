//
//  TagCell.swift
//  Laba42
//
//  Created by chizhavko on 12/21/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
  
  @IBOutlet weak var tagOutlet: UILabel!
  
  override func prepareForReuse() {
    tagOutlet.text = ""
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setAppearance()
  }
  
  // Configurate cell method
  func configurateCell(tag: String) {
    tagOutlet.text = tag
  }
  
  // Set start view appearance
  private func setAppearance() {
    layer.cornerRadius = 2
    backgroundColor = UIColor(red: 0.024, green: 0.031, blue: 0.392, alpha: 0.05)
  }
  
}
