//
//  DetailBook.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/04/25.
//

import SwiftUI

struct DetailBook: View {
    
    let pages: Int
    let language: String
    let releaseDate: String
    
    var body: some View {
        
        HStack {
            // MARK: PAGES
            if pages != 0 {
                Spacer()
                VStack(spacing: 5) {
                    Text("\(pages)")
                        .foregroundStyle(.primaryBlack)
                        .font(.system(size: 17.5, weight: .bold))
                    Text("Pages")
                        .foregroundStyle(.primaryGray)
                        .font(.system(size: 15))
                } // -> VStack
                Spacer()
                if !language.isEmpty && !releaseDate.isEmpty {
                    Divider()
                        .frame(height: 42.5)
                } // -> if
            } // -> if
            // MARK: LANGUAGE
            if !language.isEmpty {
                Spacer()
                VStack(spacing: 5) {
                    Text("\(languageName(code: language))")
                        .foregroundStyle(.primaryBlack)
                        .font(.system(size: 17.5, weight: .bold))
                    Text("Language")
                        .foregroundStyle(.primaryGray)
                        .font(.system(size: 15))
                } // -> VStack
                Spacer()
                if !releaseDate.isEmpty {
                    Divider()
                        .frame(height: 42.5)
                } // -> if
            } // -> if
            // MARK: RELEASE DATE
            if !releaseDate.isEmpty {
                Spacer()
                VStack(spacing: 5) {
                    Text("\(releaseDate.prefix(4))")
                        .foregroundStyle(.primaryBlack)
                        .font(.system(size: 17.5, weight: .bold))
                    Text("Release")
                        .foregroundStyle(.primaryGray)
                        .font(.system(size: 15))
                } // -> VStack
                Spacer()
            } // -> if
        } // -> HStack
        
    } // -> body
    
} // -> DetailBook

#Preview {
    DetailBook(pages: 100, language: "en", releaseDate: "2003-05-28")
} // -> Preview
