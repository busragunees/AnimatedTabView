//
//  TabBarPreferenceKey.swift
//
//
//  Created by Büşra Güneş on 27.09.2023.
//

import SwiftUI

struct TabBarPreferenceKey<TabItem: Tabbable>: PreferenceKey {
    static var defaultValue: [TabItem] {
        return .init()
    }
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value.append(contentsOf: nextValue())
    }
}
