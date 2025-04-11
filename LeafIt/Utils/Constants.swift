//
//  Constants.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 14/12/24.
//

import Foundation

let bookURL = "https://www.googleapis.com/books/v1/volumes?"

let bookCodeURL = "https://www.googleapis.com/books/v1/volumes/"






let appName = "Leaf It"

let readerUser = "Leaf Reader"

let defaultGreeting = "Welcome back,"

let defaultListName = "Now Reading"





let baseBookURL = "https://openlibrary.org"

let bookSearchURL = "/search.json?"

let bookTrendingURL = "/trending.json?"

//let bookURL2 = "/works/"

let bookImageStartURL = "https://covers.openlibrary.org/b/id/"

let bookImageEndURL = "-L.jpg"

let limitBookPerPage = 18
let maxLimitBookSearch = 50








let sampleBook = Book(id: "LkaYzQEACAAJ", selfLink: "https://www.googleapis.com/books/v1/volumes/7XqWAzFC8aIC", volumeInfo: VolumeInfo(title: "Meghan and Harry - The Real Story", subtitle: "The Real Story", authors: ["Lady Colin Campbell","Jack Boss Reacher"], publishedDate: "2020-06-25", description: "The fall from popular grace of the previously adulated brother of the heir to the British throne as a consequence of his marriage to a beautiful and dynamic Hollywood starlet of colour makes for fascinating reading in best-selling royal author Lady Colin Campbell's balanced account. Lady Colin knows her royal history and psychology, and as the first seven years of her adult life were spent in the USA she has a foot in both the American and British camps. With unique breadth of insight she goes behind the scenes, speaking to friends, relations, courtiers, and colleagues on both sides of the Atlantic to reveal the most unexpected royal story since the Abdication. She highlights the dilemmas involved and the issues that lurk beneath the surface, as to why the couple decided to step down as senior royals. She analyses the implications of the actions of a young and ambitious couple, in love with each other and with the empowering lure of fame and fortune. She leads the reader through the maze of contradictions, revealing how Californian culture has influenced the couple's conduct. She exposes how they tried and failed to change the royal system by adapting it to their own needs and ambitions, and, upon failing, how they decided to create a new system altogether.", pageCount: 411, averageRating: 3, ratingsCount: 2, categories: nil, maturityRating: nil, imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=_68eEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api", thumbnail: "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"), language: "en"), accessInfo: AccessInfo(webReaderLink: "http://play.google.com/books/reader?id=7XqWAzFC8aIC&hl=&source=gbs_api"))

let sampleBook2 = Book(id: "LkaYzQEACAAY", selfLink: "https://www.googleapis.com/books/v1/volumes/ptHZAAAAMAAJ", volumeInfo: VolumeInfo(title: "The Lord of the Rings", subtitle: "", authors: ["John Ronald Reuel Tolkien"], publishedDate: "2001", description: "Contains the complete set of the six books of Lord of the Rings.", pageCount: 1176, averageRating: 4.5, ratingsCount: 11, categories: ["Fiction"], maturityRating: "NOT_MATURE", imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=ptHZAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api", thumbnail: "http://books.google.com/books/content?id=ptHZAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"), language: "en"), accessInfo: AccessInfo(webReaderLink: "http://play.google.com/books/reader?id=ptHZAAAAMAAJ&hl=&source=gbs_api"))
