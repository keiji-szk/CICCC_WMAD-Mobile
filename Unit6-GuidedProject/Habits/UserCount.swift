//
//  UserCount.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-06-01.
//

import Foundation

struct UserCount {
    let user: User
    let count: Int
}

extension UserCount: Codable { }

extension UserCount: Hashable { }
