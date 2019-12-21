//
//  NetworkService.swift
//  Laba42
//
//  Created by chizhavko on 12/21/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import Foundation

class NetworkService {
  
  // Creating network request and getting data
  func request(searchTerm: String, complition: @escaping (Data?, Error?) -> Void) {
    let url = self.url(searchTerm: searchTerm)
    let task = networkRequest(from: url, complition: complition)
    task.resume()
  }
  
  // Creating URL scheme
  private func url(searchTerm: String) -> URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "l42.herokuapp.com"
    components.path = "/api/v1/projects/" + searchTerm
    return components.url!
  }
  
  // Making URL Request
  private func networkRequest(from url: URL, complition: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
    return URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        complition(data, error)
      }
    }
  }
  
}
