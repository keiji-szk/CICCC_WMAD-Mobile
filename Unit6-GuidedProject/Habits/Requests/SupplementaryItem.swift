//
//  SupplementaryItem.swift
//  Habits
//
//  Created by 鈴木啓司 on 2022-06-03.
//

import Foundation

import Foundation
import SwiftUI
enum SupplementaryItemType {
    case collectionSupplementaryView
    case layoutDecorationView
}

protocol SupplementaryItem {
    associatedtype ViewClass: UICollectionReusableView

    var itemType: SupplementaryItemType { get }

    var reuseIdentifier: String { get }
    var viewKind: String { get }
    var viewClass: ViewClass.Type { get }
}

extension SupplementaryItem {
    func register(on collectionView: UICollectionView) {
        switch itemType {
        case .collectionSupplementaryView:
            collectionView.register(viewClass.self, forSupplementaryViewOfKind: viewKind, withReuseIdentifier: reuseIdentifier)
        case .layoutDecorationView:
            collectionView.collectionViewLayout.register(viewClass.self, forDecorationViewOfKind: viewKind)
        }
    }
}


enum SupplementaryView: String, CaseIterable, SupplementaryItem {
    case leaderboardSectionHeader
    case leaderboardGroupBackground
    case leaderboardBackground
    case followedUsersSectionHeader

    var reuseIdentifier: String {
        return rawValue
    }

    var viewKind: String {
        return rawValue
    }

    var viewClass: UICollectionReusableView.Type {
        switch self {
        case .leaderboardBackground:
            return SectionBackgroundView.self
        case .leaderboardGroupBackground:
            return UICollectionReusableView.self
        default:
            return NamedSectionHeaderView.self
        }
    }

    var itemType: SupplementaryItemType {
        switch self {
        case .leaderboardBackground:
            return .layoutDecorationView
        default:
            return .collectionSupplementaryView
        }
    }
}

class SectionBackgroundView: UICollectionReusableView {
    override func didMoveToSuperview() {
        backgroundColor = .systemGray6
    }
}
