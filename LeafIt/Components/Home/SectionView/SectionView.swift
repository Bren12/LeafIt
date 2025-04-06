//
//  SectionView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import SwiftUI

struct SectionView: View {
    
    @ObservedObject private var viewModelBooks: BooksQueryManager
    let type: BookFetchType
    
    init(type: BookFetchType) {
        self.type = type
        self.viewModelBooks = BooksQueryManager(fetchType: type)
    }
    
    var body: some View {
        
        VStack {
            
            if !viewModelBooks.books.isEmpty {
                
                HStack {
                    Text(type.rawValue)
                        .foregroundStyle(.primaryBlack)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                } // -> HStack
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(viewModelBooks.books) { book in
                            NavigationLink {
                                 BookView(book: book)
                            } label: {
                                if let cover = book.volumeInfo?.imageLinks?.bestImageURL {
                                    AsyncImage(url: URL(string: (cover).replacingOccurrences(of: "http://", with: "https://"))) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(
                                                RoundedRectangle(cornerRadius: 10)
                                            ) // -> clipShape
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100)
                                    } // -> AsyncImage
                                } else {
                                    VStack {
                                        Image(systemName: "book")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50)
                                        Text("Cover Not Available")
                                    } // ->
                                    .foregroundStyle(.accent)
                                    .frame(width: 100, height: 150)
                                    .background(.white)
                                    .cornerRadius(10)
                                } // -> if-else
                            } // -> NavigationLink
                        } // -> ForEach
                    } // -> HStack
                    .frame(height: 150)
                } // -> ScrollView
                .scrollIndicators(.hidden)
                
            } // -> if
            
        } // -> VStack
        
    } // -> body
    
} // -> RecentBookView

#Preview {
    SectionView(type: .fantasy)
} // -> Preview
