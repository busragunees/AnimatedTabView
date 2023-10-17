//
//  TabBarSelection.swift
//  
//
//  Created by Büşra Güneş on 27.09.2023.
//

import SwiftUI

class TabBarSelection<TabItem: Tabbable>: ObservableObject {
    @Binding var selection: TabItem
    
    init(selection: Binding<TabItem>) {
        self._selection = selection
    }
}
