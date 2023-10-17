//
//  DefaultTabItemStyle.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public struct DefaultTabItemStyle: TabItemStyle {
    
    public func tabItem(item:any Tabbable, isSelected: Bool) -> some View {
        VStack(spacing: 5.0) {
            Image(systemName: item.icon)
                .renderingMode(.template)
                .foregroundColor(isSelected ? item.activeColor : item.inactiveColor)
            
            if item.titleVisibility{
                Text(item.title)
                    .font(.system(size: 10.0, weight: .medium))
            }
        }
        .padding(item.titleVisibility ? 8 : 16)
        .foregroundColor(isSelected ? .accentColor : .gray)
    }
}
