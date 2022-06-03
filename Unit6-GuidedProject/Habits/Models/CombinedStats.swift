//
//  combinedStats.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-06-02.
//

import Foundation

struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }

