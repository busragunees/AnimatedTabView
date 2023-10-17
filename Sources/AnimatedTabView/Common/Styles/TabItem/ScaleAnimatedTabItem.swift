//
//  ScaleAnimatedTabItem.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public struct ScaleAnimatedTabItem: TabItemStyle {
    var animation: Animation {
        Animation.bouncy
    }
    
    public func tabItem(item: any Tabbable, isSelected: Bool) -> some View {
        VStack {
            ZStack {
                if isSelected {
                    SelectedItemBackground(item:item.selectedBackgroundType)
                }
                Image(systemName: item.icon)
                    .foregroundColor(isSelected ? item.activeColor : item.inactiveColor)
                    .frame(width: 32.0, height: 32.0)
                    .scaleEffect(isSelected ? 1.2 : 0.7)
                    .animation(animation)
                
            }.frame(width: 40,height: 40)
            if item.titleVisibility{
                Text(item.title)
                    .font(.system(size: 10.0, weight: .medium))
            }
        }
        .padding(.vertical, 8.0)
    }
}
