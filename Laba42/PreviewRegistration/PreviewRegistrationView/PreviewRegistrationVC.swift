//
//  PreRegistrationVC.swift
//  Laba42
//
//  Created by chizhavko on 12/21/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import UIKit

class PreviewRegistrationVC: UIViewController {
  
  private let cellIdentifier = "PreviewCellID"
  private var offersModels: OfferCompactModel?
  
  @IBOutlet weak var collectionView: UICollectionView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    initCollectionView()
    setViewAppearance()
    setNavigationBar()
    getDataFromNetwork()
    
  }
  
  // Getting data from network in our model format
  private func getDataFromNetwork() {
    let network = NetworkDataFetcher()
    network.fetchData { [weak self] (offersData) in
      guard let self = self else { return }
      self.offersModels = offersData
      self.collectionView.reloadData()
    }
  }
  
  //MARK: Navigation Bar Set Up
  private func setNavigationBar() {
    navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.968627451, alpha: 1)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "LogoBeta"))
  }
  
  //MARK: ViewAppearance Set Up
  // Set up view appearance before showed to user
  private func setViewAppearance() {
    collectionView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.968627451, alpha: 1)
  }
  
  // Initializing collection view
  private func initCollectionView() {
    collectionView.register(UINib(nibName: "Offer", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
  }
  
}

// MARK: CollectionView Delegate & Data Source
extension PreviewRegistrationVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! OfferCell

    guard let model = offersModels?.projects[indexPath.row] else { return cell } // TODO TEST
    cell.configurateCell(model: model)
    return cell
  }
  
  
}
// MARK: CollectionView DelegateFlowLayout
extension PreviewRegistrationVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 32
    return CGSize(width: width, height: 192)
  }
}
