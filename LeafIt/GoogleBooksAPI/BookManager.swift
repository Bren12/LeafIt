//
//  BookManager.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import Foundation

class BookManager: ObservableObject {
    
    @Published var book: Book = Book(id: "", selfLink: "", volumeInfo: VolumeInfo(title: ""), accessInfo: AccessInfo(webReaderLink: ""))
    @Published var isLoading = false
    
    init(selfUrl: String) {
        requestBook(selfUrl: selfUrl)
    } // -> init
    
    func requestBook(selfUrl: String) {
        let url: URL = URL(string: selfUrl)!
            
        self.isLoading = true
        
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
                
                DispatchQueue.main.async {
                    self.book = searchResponse
                    self.isLoading = false
                } // -> DispatchQueue
                
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                } // -> DispatchQueue
                print("request failed \(error)")
            } // -> do-catch
            
        } // -> URLSession
        .resume()
        
    } // -> requestBooks
    
} // -> BooksQueryManager
