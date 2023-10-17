//
//  RotationAnimatedTabItem.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public struct RotationAnimatedTabItem: TabItemStyle {
    
    var animation: Animation {
        Animation.bouncy
    }
    
    @State var rectangleSize = 40.0
    
    public func tabItem(item: any Tabbable,isSelected:Bool) ->  some View  {
        
        VStack{
            ZStack{
                
                if isSelected {
                    SelectedItemBackground(item:item.selectedBackgroundType)
                }
                Image(systemName: item.icon)
                    .foregroundColor(isSelected ? item.activeColor : item.inactiveColor)
                    .frame(width: 32.0, height: 32.0) .scaleEffect(isSelected ? 1 : 0.7)
                    .rotationEffect(Angle.degrees(isSelected ? 360 : 0))
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
