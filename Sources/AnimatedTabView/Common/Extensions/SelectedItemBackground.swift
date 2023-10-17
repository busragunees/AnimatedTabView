//
//  SelectedItemBackground.swift
//
//
//  Created by Büşra Güneş on 27.09.2023.
//

import SwiftUI

struct SelectedItemBackground: View {
    
    @State var item: SelectedItemBackgroundType
    
    var body: some View {
        VStack {
            switch item {
            case .none:
                EmptyView()
            case .rectangle(let size, let color):
                Rectangle()
                    .cornerRadius(CGFloat(size))
                    .foregroundColor(color)
                    .frame(width: 40.0, height: 40.0)
                
            case .circle(let color):
                Circle().foregroundColor(color)
                    .frame(width: 40.0, height: 40.0)
                
            }
        }
    }
}
