//
//  HabitStatistics.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-06-01.
//

import Foundation

struct HabitStatistics {
    let habit: Habit
    let userCounts: [UserCount]
}

extension HabitStatistics: Codable { }
