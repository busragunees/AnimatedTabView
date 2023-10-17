//
//  DefaultTabBarStyle.swift
//
//
//  Created by Büşra Güneş on 17.10.2023.
//

import SwiftUI

public struct DefaultTabBarStyle: TabBarStyle {
    @State var color: Color?
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        VStack(spacing: 0.0) {
            Divider()
            VStack {
                itemsContainer()
                    .frame(height: 50.0)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
            }
            .background(color)
            .frame(height: 50.0 + geometry.safeAreaInsets.bottom)
        }
    }
    
}
