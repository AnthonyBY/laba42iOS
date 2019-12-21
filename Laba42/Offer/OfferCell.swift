//
//  OfferCell.swift
//  Laba42
//
//  Created by chizhavko on 12/21/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import UIKit

class OfferCell: UICollectionViewCell {
  
  private let cellIdentifier = "TagCellID"
  private var tags: [String] = []
  
  @IBOutlet weak var offerTitle: UILabel!
  @IBOutlet weak var offerDescription: UILabel!
  @IBOutlet weak var projectType: UILabel!
  @IBOutlet weak var dateOfCreated: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func prepareForReuse() {
    offerTitle.text = ""
    offerDescription.text = ""
    projectType.text = ""
    dateOfCreated.text = ""
    tags = []
  }
  
  override func awakeFromNib() {
    initCollectionView()
    setAppearance()
  }
  
  // Configurate cell method
  func configurateCell(model: Project) {
    offerTitle.text = model.title
    offerDescription.text = model.info
    projectType.text = model.type
    dateOfCreated.text = model.created_at
    setTags(tags: model.skills)
  }
  
  // Set tags into cell
  private func setTags(tags: [String]) {
    self.tags = tags
    collectionView.reloadData()
  }
  
  // Set start view appearance
  private func setAppearance() {
    layer.cornerRadius = 8
  }
  
  // Initializing collection view
  private func initCollectionView() {
    collectionView.register(UINib(nibName: "TagCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
}

// MARK: CollectionView Delegate & Data Source
extension OfferCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tags.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TagCell
    let tag = tags[indexPath.row]
    cell.tagOutlet.text = tag
    return cell
  }
}

// MARK: CollectionView DelegateFlowLayout
//extension OfferCell: UICollectionViewDelegateFlowLayout {
//  
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//      return CGSize(width: collectionView.frame.width, height: 24)
//    }
//}
