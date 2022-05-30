//
//  FoodItem.swift
//  MyRestaurant
//
//  Created by 鈴木啓司 on 2022-05-29.
//

import Foundation




struct FoodMenu: Hashable{
  var title: String
  var imageName: String
  var price: Int
  var categories: [FoodCategory]
  
}
