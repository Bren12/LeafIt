//
//  TabOptions.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import Foundation

enum Tab: String {
    case home
    case explore
    case library
    
    var title: String {
        switch self {
            case .home: return "Home"
            case .explore: return "Explore"
            case .library: return "Library"
        } // -> switch
    } // -> title
    
    var icon: String {
        switch self {
            case .home: return "house"
            case .explore: return "magnifyingglass"
            case .library: return "books.vertical"
        } // -> switch
    } // -> title
} // -> TabOptions
