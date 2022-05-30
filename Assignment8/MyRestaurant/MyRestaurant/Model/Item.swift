//
//  Item.swift
//  MyRestaurant
//
//  Created by 鈴木啓司 on 2022-05-29.
//

import Foundation

enum Item: Hashable{
  case category(FoodCategoryItem)
  case menu(FoodMenu)
  
  var category: FoodCategoryItem? {
    if case .category(let category) = self{
      return category
    }else{
      return nil
    }
  }
  
  var menu: FoodMenu?{
    if case .menu(let menu) = self{
      return menu
    }else{
      return nil
    }
  }
  
  static var categoryItems: [Item] = [
    .category(FoodCategoryItem(category: FoodCategory.Asian)),
    .category(FoodCategoryItem(category: FoodCategory.Mexican)),
    .category(FoodCategoryItem(category: FoodCategory.American)),
    .category(FoodCategoryItem(category: FoodCategory.Indian)),
    .category(FoodCategoryItem(category: FoodCategory.Japanese)),
    .category(FoodCategoryItem(category: FoodCategory.Lunch)),
    .category(FoodCategoryItem(category: FoodCategory.BreakFast)),
    .category(FoodCategoryItem(category: FoodCategory.Dinner)),
    .category(FoodCategoryItem(category: FoodCategory.Formal)),
    .category(FoodCategoryItem(category: FoodCategory.Casual))
  ]
  
  static var foodMenuItems: [Item] = [
    .menu(FoodMenu(title: "Sushi", imageName: "Sushi", price: 20, categories: [.Japanese, .Dinner, .Formal])),
    .menu(FoodMenu(title: "Humberger", imageName: "Humberger", price: 12, categories: [.American, .Lunch, .Casual])),
    .menu(FoodMenu(title: "Kerala", imageName: "Kerala", price: 10, categories: [.Asian, .BreakFast, .Casual])),
    .menu(FoodMenu(title: "Curry", imageName: "Curry", price: 11, categories: [.Indian, .Lunch, .Formal])),
    .menu(FoodMenu(title: "Tendon", imageName: "Tendon", price: 18, categories: [.Japanese, .Lunch, .Casual])),
    .menu(FoodMenu(title: "Pho", imageName: "Pho", price: 13, categories: [.Asian, .Lunch, .Casual])),
    .menu(FoodMenu(title: "Pizza", imageName: "Pizza", price: 22, categories: [.American, .Lunch, .Casual])),
    .menu(FoodMenu(title: "Sukhi", imageName: "Sukhi", price: 10, categories: [.Indian, .BreakFast, .Formal])),
    .menu(FoodMenu(title: "Chipotle", imageName: "Chipotle", price: 14, categories: [.Mexican, .Lunch, .Casual]))
    
  ]
  
}
