//
//  ListView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 12/04/25.
//

import SwiftUI

struct ListView: View {
    
    let lists: [DBList]
    
    private let rows = [
        GridItem(.flexible(), spacing: 50),
        GridItem(.flexible(), spacing: 50)
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: rows, spacing: 20) {
                ForEach(lists, id: \.listId) { list in
                    NavigationLink {
//                                    BookListView(listID: list.listId!, listName: list.name!)
                    } label: {
                        Text("\(list.name)")
                            .foregroundStyle(.primaryWhite)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 160, height: 160)
                            .background(.accent)
                            .cornerRadius(10)
                    } // -> NavigationLink
                } // -> ForEach
            } // -> LazyVGrid
            .padding(.horizontal)
        } // -> ScrollView
        .scrollIndicators(.hidden)
        
    } // -> body
    
} // -> ListView

#Preview {
    ListView(lists: [DBList]())
} // -> Preview
