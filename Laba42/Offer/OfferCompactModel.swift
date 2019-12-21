//
//  OfferModel.swift
//  Laba42
//
//  Created by chizhavko on 12/21/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import Foundation

// EXAMPLES
// https://l42.herokuapp.com/api/v1/projects
// https://l42.herokuapp.com/api/v1/projects/1

struct OfferCompactModel: Decodable {
  let projects: [Project]
}

struct Project: Decodable {
  let id: Int
  let title: String
  let created_at: String
  let deadline: String
  let skills: [String]
  let info: String
  let type: String
}


