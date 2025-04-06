//
//  RecentBooksModel.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 03/04/25.
//

import Foundation

class BooksQueryManager: ObservableObject {
    
    @Published var books = [Book]()
    @Published var isLoading = false
    
    private var startIndex = 0
    private var fetchType: BookFetchType
    
    init(fetchType: BookFetchType) {
        self.fetchType = fetchType
        requestBooks()
    } // -> init
    
    func resetSearch() {
        self.books = []
    } // -> resetSearch
    
    func requestBooks() {
        var url: URL = URL(string: bookURL)!
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "q", value: fetchType == .query ? "*" : "subject:\(fetchType.urlParameter)"),
            URLQueryItem(name: "country", value: "ES"),
            URLQueryItem(name: "langRestrict", value: "es"),
            URLQueryItem(name: "startIndex", value: "\(startIndex)"),
            URLQueryItem(name: "maxResults", value: "\(limitBookPerPage)"),
        ]
        .compactMap { $0.value != nil ? $0 : nil }
        url.append(queryItems: queryItems)
            
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.isLoading = false
                } // -> DispatchQueue
                print("search failed")
                return
            } // -> guard
            
            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(BookSearchResponse.self, from: data)
                
                DispatchQueue.main.async {
                    if self.startIndex == 0 {
                        self.books = searchResponse.items ?? []
                    } else {
                        self.books.append(contentsOf: searchResponse.items ?? [])
                    } // -> if-else
//                    self.isLoading = false
                } // -> DispatchQueue
                
                // Extract best quality covers per book (Not efficient)
//                DispatchQueue.main.async {
//                    if let booksAux = searchResponse.items {
//                        for index in 0..<(booksAux).count {
//                            if let _ = booksAux[index].volumeInfo {
//                                self.requestCoverImage(bookUrl: booksAux[index].selfLink, index: index)
//                            } // -> if
//                        } // -> for
//                    } // -> if
//                    self.isLoading = false
//                } // -> DispatchQueue
                
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                } // -> DispatchQueue
                print("request failed \(error)")
            } // -> do-catch
            
        } // -> URLSession
        .resume()
        
    } // -> requestBooks
    
    // Extract best quality covers
    func requestCoverImage(bookUrl: String, index: Int) {
        let url: URL = URL(string: bookUrl)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    self.isLoading = false
                } // -> DispatchQueue
                print("search failed")
                return
            } // -> guard
            
            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(Book.self, from: data)
                self.books[index].volumeInfo?.imageLinks = searchResponse.volumeInfo?.imageLinks
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                } // -> DispatchQueue
                print("request failed \(error)")
            } // -> do-catch
        } // -> URLSession
        .resume()
    } // -> requestCoverImage
    
} // -> BooksQueryManager
