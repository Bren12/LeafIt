//
//  TabBar.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/12/24.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label(Tab.home.title, systemImage: Tab.home.icon)
                }
                .tag(Tab.home)
            
//            ExploreView()
            HomeView(selectedTab: $selectedTab)
//            BookIcon()
                .tabItem {
                    Label(Tab.explore.title, systemImage: Tab.explore.icon)
                }
                .tag(Tab.explore)
            
//            LibraryView()
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label(Tab.library.title, systemImage: Tab.library.icon)
                }
                .tag(Tab.library)
            
        } // -> TabView
        
    } // -> body
    
} // -> TabBar

#Preview {
    TabBar()
} // -> Preview
