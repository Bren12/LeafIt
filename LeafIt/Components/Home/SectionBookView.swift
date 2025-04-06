//
//  RecentBookView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import SwiftUI

struct SectionBookView: View {
    
//    @ObservedObject private var viewRecentBook = BooksQueryManager(fetchType: .recent)
    let type: BookFetchType
    
    var body: some View {
        Text("\(type.rawValue)")
        //                        HStack {
        //                            Text("Recently published")
        //                                .foregroundStyle(.primaryBlack)
        //                                .font(.system(size: 20, weight: .semibold))
        //                            Spacer()
        //                        } // -> HStack
        //
        //                        ScrollView(.horizontal) {
        //                            HStack(spacing: 15) {
        //                                ForEach(viewRecentBook.books, id: \.self) { book in
        //                                    NavigationLink {
        //                                        // BookView(book: book)
        //                                    } label: {
        //                                        if let cover = book.cover_i {
        //                                            AsyncImage(url: URL(string: bookImageStartURL + "\(cover)" + bookImageEndURL)) { image in
        //                                                image
        //                                                    .resizable()
        //                                                    .scaledToFit()
        //                                                    .clipShape(
        //                                                        RoundedRectangle(cornerRadius: 10)
        //                                                    ) // -> clipShape
        //                                            } placeholder: {
        //                                                ProgressView()
        //                                                    .frame(width: 100)
        //                                            } // -> AsyncImage
        //                                        } else {
        //                                            ProgressView()
        //                                                .frame(width: 100)
        //                                        } // -> if-else
        //                                    } // -> NavigationLink
        //                                } // -> ForEach
        //                            } // -> HStack
        //                            .frame(height: 150)
        //                        } // -> ScrollView
        //                        .scrollIndicators(.hidden)
        //                        .padding(.horizontal, -16)
        //                        .padding(.leading)
        
    } // -> body
    
} // -> RecentBookView

#Preview {
    SectionBookView(type: .recent)
} // -> Preview
