//
//  Tabbable.swift
//
//
//  Created by Büşra Güneş on 29.09.2023.
//

import Foundation
import SwiftUI


public protocol Tabbable: Hashable {
    var icon: String { get }
    var selectedIcon: String { get }
    var title: String { get }
    var titleVisibility:Bool { get }
    var activeColor:Color { get }
    var inactiveColor:Color { get }
    var selectedBackgroundType:SelectedItemBackgroundType { get }
}

public enum SelectedItemBackgroundType {
    case rectangle(size: Int, color: Color)
    case circle(color: Color)
    case none
}

public extension Tabbable {
    var selectedIcon: String {
        return self.icon
    }
}
