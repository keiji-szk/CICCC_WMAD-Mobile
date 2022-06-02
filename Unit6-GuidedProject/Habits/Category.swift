//
//  Category.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-05-31.
//

import Foundation

struct Category: Hashable {
  let name: String
  let color: Color
  
  static func == (lhs: Category, rhs: Category) -> Bool {
    return lhs.name == rhs.name
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
  }
}

extension Category: Codable { }
