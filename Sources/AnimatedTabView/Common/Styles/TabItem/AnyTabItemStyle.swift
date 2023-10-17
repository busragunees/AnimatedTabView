//
//  AnyTabItemStyle 5.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

struct AnyTabItemStyle: TabItemStyle {
   
    private let _makeTabItem: (any Tabbable, Bool) -> AnyView
    
    public init<TabItem: TabItemStyle>(itemStyle: TabItem) {
        self._makeTabItem = itemStyle.tabItemErased(item:isSelected:)
    }
    
    public func tabItem(item:any Tabbable, isSelected: Bool) -> some View {
        return self._makeTabItem(item, isSelected)
    }
}
