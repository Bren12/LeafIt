//
//  BookManager.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import Foundation

//class BookManager: ObservableObject {
//    
//    @Published var books = [Book]()
//    @Published var isLoading = false
//    
//    private var booksAux = [Book]() // Filter Aux
//    
//    private var startPage = 1
//    private var lastIndex = limitBookPerPage*20
//    private var fetchType: BookFetchType
//    
//    init(fetchType: BookFetchType) {
//        self.fetchType = fetchType
//        requestBooks()
//    } // -> init
//    
//    func requestBooks() {
//        var url: URL
//        
//        switch fetchType {
//            case .recent:
//                url = URL(string: baseBookURL + bookSearchURL)!
//            case .trending:
//                url = URL(string: baseBookURL + bookTrendingURL)!
//        } // -> switch
//        
//        let queryItems: [URLQueryItem] = [
//            URLQueryItem(name: "q", value: fetchType == .recent ? "*" : nil),
//            URLQueryItem(name: "language", value: "eng"),
//            URLQueryItem(name: "sort", value: fetchType == .recent ? "new" : nil),
//            URLQueryItem(name: "limit", value: "\(maxLimitBookSearch)"),
//            URLQueryItem(name: "page", value: "\(startPage)"),
//        ]
//        .compactMap { $0.value != nil ? $0 : nil } // Delete nil queryItems
//        url.append(queryItems: queryItems)
//        
//        if self.startPage*limitBookPerPage < self.lastIndex {
//            
//            isLoading = true
//            
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                
//                guard let data = data else {
//                    DispatchQueue.main.async {
//                        self.isLoading = false
//                    } // -> DispatchQueue
//                    print("search failed")
//                    return
//                } // -> guard
//                
//                do {
//                    let decoder = JSONDecoder()
//                    var unfilteredBooks: [Book] = []
//                    
//                    if self.fetchType == .recent {
//                        let searchResponse = try decoder.decode(BookSearchResponse.self, from: data)
//                        self.lastIndex = searchResponse.num_found
//                        unfilteredBooks = searchResponse.docs ?? []
//                    } else {
//                        let searchResponse = try decoder.decode(BookSearchTrendResponse.self, from: data)
//                        unfilteredBooks = searchResponse.works ?? []
//                    } // -> if-else
//                    
//                    self.booksAux.append(contentsOf: self.filterBooksWithCoverImage(books: unfilteredBooks))
//                    
//                    if self.booksAux.count < limitBookPerPage {
//                        self.startPage += 1
//                        self.requestBooks()
//                    } else {
//                        self.books.append(contentsOf: self.booksAux.prefix(limitBookPerPage))
//                        return
//                    }
//                    self.isLoading = false
//                } catch {
//                    self.isLoading = false
//                    print("request failed \(error)")
//                } // -> do-catch
//                
//            } // -> URLSession
//            .resume()
//            
//        } // -> if
//        
//    } // -> requestBooks
//    
//    func filterBooksWithCoverImage(books: [Book]) -> [Book] {
//        books.compactMap { book -> Book? in
//            if let coverID = book.cover_i {
//                return Book(
//                    author_name: book.author_name,
//                    cover_i: coverID,
//                    key: book.key,
//                    title: book.title
//                ) // -> Book2
//            } // -> if
//            return nil
//        } // -> books.compactMap
//    } // -> filterBooksWithCoverImage
//    
//} // -> BooksQueryManager
