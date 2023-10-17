//
//  ContentView.swift
//  AnimatedTabBarExample
//
//  Created by Büşra Güneş on 12.10.2023.
//

import SwiftUI
import AnimatedTabView

struct ContentView: View {
    
    private enum Item: Int, Tabbable {
        
        case home = 0
        case search
        case profile
        
        var selectedBackgroundType: SelectedItemBackgroundType{
            return .rectangle(size: 12, color: Color.indigo)
        }
        
        var titleVisibility: Bool{
            return false
        }
        
        var activeColor: Color {
            return Color.white
        }
        
        var inactiveColor: Color{
            return Color.indigo
        }
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .search: return "magnifyingglass"
            case .profile: return "person"
            }
        }
        
        var title: String {
            switch self {
            case .home: return "First"
            case .search: return "Second"
            case .profile: return "Third"
            }
        }
    }
    
    @State private var selection: Item = .home
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        AnimatedTabbar(selection: $selection, visibility: $visibility) {
            
            Button {
                withAnimation {
                    visibility.toggle()
                }
            } label: {
                Text("Hide/Show TabBar")
            }
            .tabItem(for: Item.home)
            
            Text("Second")
                .tabItem(for: Item.search)
            
            Text("Third")
                .tabItem(for: Item.profile)
        }
        .tabBar(style: .defaultTabbar())
        .tabItem(style:.rotationAnimation)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
