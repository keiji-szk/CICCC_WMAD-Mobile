//
//  FoodCategory.swift
//  MyRestaurant
//
//  Created by 鈴木啓司 on 2022-05-29.
//

import Foundation

struct FoodCategoryItem: Hashable{
  let category: FoodCategory?
}

enum FoodCategory: Hashable{
  case Asian
  case Mexican
  case American
  case Indian
  case Japanese
  case Lunch
  case BreakFast
  case Dinner
  case Formal
  case Casual

  func name() -> String!{
    switch self{
    case .Asian:
      return "Asian"
    case .Mexican:
      return "Mexican"
    case .American:
      return "American"
    case .Indian:
      return "Indian"
    case .Japanese:
      return "Japanese"
    case .BreakFast:
      return "BreakFast"
    case .Lunch:
      return "Lunch"
    case .Dinner:
      return "Dinner"
    case .Formal:
      return "Formal"
    case .Casual:
      return "Casual"
    }
  }
}
