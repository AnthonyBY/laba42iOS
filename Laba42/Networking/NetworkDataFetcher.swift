//
//  NetworkDataFetcher.swift
//  Laba42
//
//  Created by chizhavko on 12/21/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
  
  var networkService = NetworkService()
  
  // Getting data from network and passing into completion our model
  func fetchData(searchTerm: String = "", complition: @escaping (OfferCompactModel?) -> Void) {
    networkService.request(searchTerm: searchTerm) { (data, error) in
      if let error = error {
        print(error.localizedDescription)
        complition(nil)
      }
      let decodedData = self.decodeJSON(type: OfferCompactModel.self, from: data!)
      complition(decodedData)
    }
  }
  
  // Converting data into DECODABLE!!! model
  private func decodeJSON<T: Decodable>(type: T.Type, from: Data) -> T? {
    do {
      let object = try JSONDecoder().decode(type, from: from)
      return object
    }catch let error {
      print(error.localizedDescription)
       return nil
    }
  }
  
}
