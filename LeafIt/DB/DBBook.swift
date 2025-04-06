//
//  DBBook.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 02/04/25.
//

import Foundation
import SwiftData

@Model
class DBBook: Identifiable {
    var bookId: UUID = UUID()
    @Relationship var lists: [DBList] = []
    var bookOL: Int
    var pages: Int
    var readPages: Int
    var completed: Bool
    
    init(
        bookId: UUID,
        bookOL: Int,
        pages: Int,
        readPages: Int,
        completed: Bool
    ) {
        self.bookId = bookId
        self.bookOL = bookOL
        self.pages = pages
        self.readPages = readPages
        self.completed = completed
    } // -> init
} // -> DBBook
