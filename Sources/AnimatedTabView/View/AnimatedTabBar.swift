//
//  AnimatedTabbar.swift
//
//
//  Created by Büşra Güneş on 27.09.2023.
//

import SwiftUI

public struct AnimatedTabbar<TabItem: Tabbable, Content: View>: View {
    
    private let selectedItem: TabBarSelection<TabItem>
    private let content: Content
    
    private var tabItemStyle: AnyTabItemStyle
    private var tabBarStyle: AnyTabBarStyle
    
    @State private var items: [TabItem]
    
    @Binding private var visibility: TabBarVisibility
    
    public init(
        selection: Binding<TabItem>,
        visibility: Binding<TabBarVisibility> = .constant(.visible),
        @ViewBuilder content: () -> Content
    ) {
        self.tabItemStyle = .init(itemStyle: DefaultTabItemStyle())
        self.tabBarStyle = .init(barStyle: DefaultTabBarStyle())
        
        self.selectedItem = .init(selection: selection)
        self.content = content()
        
        self._items = .init(initialValue: .init())
        self._visibility = visibility
    }
    
    private var tabItems: some View {
        HStack {
            
            ForEach(self.items, id: \.self) { item in
                
                self.tabItemStyle.tabItem(item:item,isSelected:self.selectedItem.selection == item)
                
                    .onTapGesture {
                        self.selectedItem.selection = item
                        self.selectedItem.objectWillChange.send()
                    }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    public var body: some View {
        ZStack {
            self.content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environmentObject(self.selectedItem)
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    self.tabBarStyle.tabBar(with: geometry) {
                        .init(self.tabItems)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .visibility(self.visibility)
            }
        }
        .onPreferenceChange(TabBarPreferenceKey.self) { value in
            self.items = value
        }
    }
    
    
    public enum TabItemType {
        case rotationAnimation
        case scaleAnimation
        case defaultTabItem
        case third
    }
    
    public enum TabBarType {
        case circledTabbar(color:Color? = Color.gray)
        case roundedTabbar(color:Color? = Color.gray)
        case defaultTabbar(color:Color? = Color.gray)
    }
    
}

extension AnimatedTabbar {
    
    public func tabItem(style: TabItemType) -> Self {
        var _self = self
        switch style {
        case .rotationAnimation:
            _self.tabItemStyle = .init(itemStyle: RotationAnimatedTabItem())
        case .scaleAnimation:
            _self.tabItemStyle = .init(itemStyle: ScaleAnimatedTabItem())
        case .defaultTabItem:
            _self.tabItemStyle = .init(itemStyle: DefaultTabItemStyle())
        case .third:
            _self.tabItemStyle = .init(itemStyle: DefaultTabItemStyle())
        }
        return _self
    }
    
    
    public func tabBar(style: TabBarType) -> Self {
        var _self = self
        switch style{
        case .circledTabbar(let color):
            _self.tabBarStyle = .init(barStyle: CircledTabBarStyle(color: color))
        case .roundedTabbar(let color):
            _self.tabBarStyle = .init(barStyle: RoundedTabBarStyle(color:color))
        case .defaultTabbar(let color):
            _self.tabBarStyle = .init(barStyle: DefaultTabBarStyle(color:color))
            
        }
        return _self
    }
}
