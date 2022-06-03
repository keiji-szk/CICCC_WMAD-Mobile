//
//  Settings.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-05-31.
//

import Foundation

struct Settings {
  static var shared = Settings()
  
  private let defaults = UserDefaults.standard
  
  let currentUser = User(id: "activeUser", name: "Active User", color: nil, bio: nil)
  
  enum Setting {
    static let favoriteHabits = "favoriteHabits"
    static let followedUserIDs = "followedUserIDs"
  }

  
  var followedUserIDs: [String] {
    get {
      return unarchiveJSON(key: Setting.followedUserIDs) ?? []
    }
    set {
      archiveJSON(value: newValue, key: Setting.followedUserIDs)
    }
  }
  
  var favoriteHabits: [Habit] {
    get {
      return unarchiveJSON(key: Setting.favoriteHabits) ?? []
    }
    set {
      archiveJSON(value: newValue, key: Setting.favoriteHabits)
    }
  }
  
  private func archiveJSON<T: Encodable>(value: T, key: String) {
    let data = try! JSONEncoder().encode(value)
    let string = String(data: data, encoding: .utf8)
    defaults.set(string, forKey: key)
  }
  
  private func unarchiveJSON<T: Decodable>(key: String) -> T? {
    guard let string = defaults.string(forKey: key),
          let data = string.data(using: .utf8) else {
      return nil
    }
    return try! JSONDecoder().decode(T.self, from: data)
  }
  
  mutating func toggleFavorite(_ habit: Habit) {
    var favorites = favoriteHabits
    
    if favorites.contains(habit) {
      favorites = favorites.filter { $0 != habit }
    } else {
      favorites.append(habit)
    }
    
    favoriteHabits = favorites
  }
  
  mutating func toggleFollowed(user: User) {
      var updated = followedUserIDs

      if updated.contains(user.id) {
          updated = updated.filter { $0 != user.id }
      } else {
          updated.append(user.id)
      }

      followedUserIDs = updated
  }
}

