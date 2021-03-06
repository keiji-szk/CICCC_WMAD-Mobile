//
//  ResponseModels.swift
//  OrderApp
//
//  Created by 鈴木啓司 on 2022-05-21.
//

import Foundation

struct MenuResponse: Codable{
  let items: [MenuItem]
}

struct CategoriesResponse: Codable{
  let categories: [String]
}

struct OrderResponse: Codable{
  let prepTime: Int
  
  enum CodingKeys: String, CodingKey{
    case prepTime = "preparation_time"
  }
}

struct Order: Codable{
  var menuItems:[MenuItem]
  
  init(menuItems: [MenuItem] = []){
    self.menuItems = menuItems
  }
}
