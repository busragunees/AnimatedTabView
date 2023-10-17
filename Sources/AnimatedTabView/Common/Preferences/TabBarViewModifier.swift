//
//  TabBarViewModifier.swift
//
//
//  Created by Büşra Güneş on 27.09.2023.
//

import SwiftUI

struct TabBarViewModifier<TabItem: Tabbable>: ViewModifier {
    @EnvironmentObject private var selectionObject: TabBarSelection<TabItem>
    
    let item: TabItem
    
    func body(content: Content) -> some View {
        Group {
            if self.item == self.selectionObject.selection {
                content
            } else {
                Color.clear
            }
        }
        .preference(key: TabBarPreferenceKey.self, value: [self.item])
    }
}

extension View {
    public func tabItem<TabItem: Tabbable>(for item: TabItem) -> some View {
        return self.modifier(TabBarViewModifier(item: item))
    }
}
