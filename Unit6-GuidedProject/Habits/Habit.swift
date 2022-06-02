//
//  Habit.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-05-31.
//

import Foundation

struct Habit: Hashable, Codable{
    let name: String
    let category: Category
    let info: String
  
  static func == (lhs: Habit, rhs: Habit) -> Bool {
      return lhs.name == rhs.name
  }

  func hash(into hasher: inout Hasher) {
      hasher.combine(name)
  }
}

extension Habit: Comparable {
    static func < (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.name < rhs.name
    }
}
