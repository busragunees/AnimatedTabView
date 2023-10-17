//
//  TabItemStyle.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public protocol TabItemStyle {
    associatedtype Content : View
    
    func tabItem(icon: String, title: String, isSelected: Bool) -> Content
    func tabItem(icon: String, selectedIcon: String, title: String, isSelected: Bool) -> Content
    
    func tabItem(item: any Tabbable,isSelected:Bool) -> Content
}

extension TabItemStyle {
    
    public func tabItem(item: any Tabbable,isSelected: Bool) -> Content {
        return self.tabItem(item:item,isSelected: isSelected)
    }
    
    public func tabItem(icon: String, title: String, isSelected: Bool) -> Content {
        return self.tabItem(icon: icon, selectedIcon: icon, title: title, isSelected: isSelected)
    }
    
    public func tabItem(icon: String, selectedIcon: String, title: String, isSelected: Bool) -> Content {
        return self.tabItem(icon: icon, title: title, isSelected: isSelected)
    }
    
    func tabItemErased(item:any Tabbable, isSelected: Bool) -> AnyView {
        return .init(self.tabItem(item:item, isSelected: isSelected))
    }
}
