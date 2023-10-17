//
//  CircledTabBarStyle.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public struct CircledTabBarStyle: TabBarStyle {
    @State var color: Color?
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(color)
            .cornerRadius(25.0)
            .frame(height: 50.0)
            .padding(.horizontal, 64.0)
            .padding(.bottom, 16.0 + geometry.safeAreaInsets.bottom)
    }
}

