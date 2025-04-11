//
//  BookView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import SwiftUI

struct BookView: View {
    
    var book: Book
    
    private var thumbnail: String { book.volumeInfo?.imageLinks?.bestImageURL ?? "" }
    private var title: String { book.volumeInfo?.title ?? "" }
    private var subTitle: String { book.volumeInfo?.subtitle ?? "" }
    private var authors: [String] { book.volumeInfo?.authors ?? [] }
    private var rating: Float? { book.volumeInfo?.averageRating ?? 0.0 }
    private var pages: Int { book.volumeInfo?.pageCount ?? 0 }
    private var language: String { book.volumeInfo?.language ?? "" }
    private var releaseDate: String { book.volumeInfo?.publishedDate ?? "" }
    private var categories: [String] { book.volumeInfo?.categories ?? [] }
    private var description: String { book.volumeInfo?.description ?? ""}
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.primaryWhite
                .ignoresSafeArea(edges: .top)
                
            VStack {
                
                VStack {
                    
                    // MARK: IMAGE
                    if !thumbnail.isEmpty {
                        BookWebImage(thumbnail: thumbnail)
                    } else {
                        NoCoverBook()
                    } // -> if-else
                    
                    Spacer()
                        .frame(height: 30)
                    
                    // MARK: TITLE
                    if !title.isEmpty {
                        Text(title)
                            .foregroundStyle(.primaryBlack)
                            .font(.system(size: 25, weight: .bold))
                            .multilineTextAlignment(.center)
                    } // -> if
                    
                    // MARK: SUBTITLE
                    if !subTitle.isEmpty {
                        Text(subTitle)
                            .foregroundStyle(.primaryBlack)
                            .font(.system(size: 20, weight: .medium))
                            .multilineTextAlignment(.center)
                    } // -> if
                    
                    if !title.isEmpty || !subTitle.isEmpty {
                        Spacer()
                            .frame(height: 15)
                    } // -> if
                    
                    // MARK: AUTHORS
                    ForEach(authors, id: \.self) { author in
                        Text(author)
                            .foregroundStyle(.primaryGray)
                            .font(.system(size: 17.5, weight: .regular))
                    } // -> ForEach
                    
                    if !authors.isEmpty {
                        Spacer()
                            .frame(height: rating ?? 0.0 > 1.0 ? 15 : 20)
                    } // -> if
                    
                    // MARK: RATING
                    if let ratingExist = rating {
                        HStack {
                            ForEach(0..<Int(ratingExist), id:\.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                            } // -> ForEach
                        } // -> HStack
                        Spacer()
                            .frame(height: 20)
                    } // -> if
                    
                    // MARK: DETAIL INFO
                    if pages != 0 || !language.isEmpty || !releaseDate.isEmpty {
                        DetailBook(pages: pages, language: language, releaseDate: releaseDate)
                        Spacer()
                            .frame(height: 15)
                    } // -> if
                    
                    // MARK: CATEGORIES
                    if categories.count > 0 {
                        CategoriesView(categories: categories)
                        Spacer()
                            .frame(height: 15)
                    } // -> if
                    
                } // -> VStack
                .padding(.horizontal)
                
                // MARK: DESCRIPTION
                DescriptionView(description: description)
            
            } // -> VStack
            
        } // -> ZSStack
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
//                    deleteTrip(trip: trip)
//                    dismiss()
                }) {
                    Image(systemName: "bookmark")
                } // -> Button
            } // -> ToolbarItem
        } // -> ZSStack.toolbar
        
//        .sheet(isPresented: $showSheet) {
//            BookSheetView(showSheet: $showSheet, book: book)
//                .presentationDetents([.large])
//        }
        
    } // -> body
    
} // -> BookView

#Preview {
    BookView(book: sampleBook2)
}
