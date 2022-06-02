//
//  UserStatistics.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-06-01.
//

import Foundation

struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}

extension UserStatistics: Codable { }
