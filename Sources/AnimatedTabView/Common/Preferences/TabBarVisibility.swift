//
//  TabBarVisibility.swift
//
//
//  Created by Büşra Güneş on 27.09.2023.
//

import Foundation

public enum TabBarVisibility: CaseIterable {
    case visible
    case invisible
    
    public mutating func toggle() {
        switch self {
        case .visible:
            self = .invisible
        case .invisible:
            self = .visible
        }
    }
}
