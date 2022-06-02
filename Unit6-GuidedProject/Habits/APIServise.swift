//
//  APIServise.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-05-31.
//

import UIKit

struct ImageRequest: APIRequest {
    typealias Response = UIImage

    var imageID: String

    var path: String { "/images/" + imageID }
}

struct HabitRequest: APIRequest {
  typealias Response = [String: Habit]
  
  var habitName: String?
  
  var path: String { "/habits" }
}

struct UserRequest: APIRequest {
  typealias Response = [String: User]
  
  var path: String { "/users" }
}

struct HabitStatisticsRequest: APIRequest {
  typealias Response = [HabitStatistics]
  
  var habitNames: [String]?
  
  var path: String { "/habitStats" }
  
  var queryItems: [URLQueryItem]? {
    if let habitNames = habitNames {
      return [URLQueryItem(name: "names", value: habitNames.joined(separator: ","))]
    } else {
      return nil
    }
  }
}

struct UserStatisticsRequest: APIRequest {
    typealias Response = [UserStatistics]

    var userIDs: [String]?

    var path: String { "/userStats" }

    var queryItems: [URLQueryItem]? {
        if let userIDs = userIDs {
            return [URLQueryItem(name: "ids", value: userIDs.joined(separator: ","))]
        } else {
            return nil
        }
    }
}

struct HabitLeadStatisticsRequest: APIRequest {
    typealias Response = UserStatistics

    var userID: String

    var path: String { "/userLeadingStats/\(userID)" }
}

struct LogHabitRequest: APIRequest {
    typealias Response = Void

    var trackedEvent: LoggedHabit

    var path: String { "/loggedHabit" }

    var postData: Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try! encoder.encode(trackedEvent)
    }
}

struct CombinedStatisticsRequest: APIRequest {
    typealias Response = CombinedStatistics
    
    var path: String { "/combinedStats" }
}
