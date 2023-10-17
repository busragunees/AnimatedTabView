//
//  TabBarStyle.swift
//  
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public protocol TabBarStyle {
    associatedtype Content: View
    
    func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> Content
}

extension TabBarStyle {
    func tabBarErased(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> AnyView {
        return .init(self.tabBar(with: geometry, itemsContainer: itemsContainer))
    }
}
