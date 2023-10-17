//
//  AnyTabBarStyle.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

struct AnyTabBarStyle: TabBarStyle {
    private let _makeTabBar: (GeometryProxy, @escaping () -> AnyView) -> AnyView
    
    public init<BarStyle: TabBarStyle>(barStyle: BarStyle) {
        self._makeTabBar = barStyle.tabBarErased
    }
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        return self._makeTabBar(geometry, itemsContainer)
    }
}
