//
//  Book.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 14/12/24.
//

import Foundation

struct BookSearchResponse: Codable {
    let totalItems: Int
    let items: [Book]?
} // -> BookSearchResponse

struct Book: Codable, Identifiable {
    let id: String?
    let selfLink: String
    let volumeInfo: VolumeInfo?
    let accessInfo: AccessInfo?
} // -> Book

struct VolumeInfo: Codable {
    let title: String
    let subtitle: String?
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let pageCount: Int?
    let averageRating: Float?
    let ratingsCount: Int?
    let categories: [String]?
    let maturityRating: String?
    let imageLinks: ImageLinks?
    let language: String?
    
    init(title: String,
         subtitle: String? = nil,
         authors: [String]? = nil,
         publishedDate: String? = nil,
         description: String? = nil,
         pageCount: Int? = nil,
         averageRating: Float? = nil,
         ratingsCount: Int? = nil,
         categories: [String]? = nil,
         maturityRating: String? = nil,
         imageLinks: ImageLinks? = nil,
         language: String? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.authors = authors
        self.publishedDate = publishedDate
        self.description = description
        self.pageCount = pageCount
        self.averageRating = averageRating
        self.ratingsCount = ratingsCount
        self.categories = categories
        self.maturityRating = maturityRating
        self.imageLinks = imageLinks
        self.language = language
    } // -> init
} // -> VolumeInfo

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
    let small: String?
    let medium: String?
    let large: String?
    let extraLarge: String?
    var bestImageURL: String? {
        return extraLarge
            ?? large
            ?? medium
            ?? small
            ?? thumbnail
            ?? smallThumbnail
    } // -> bestImageURL
    
    init(
        smallThumbnail: String? = nil,
        thumbnail: String? = nil,
        small: String? = nil,
        medium: String? = nil,
        large: String? = nil,
        extraLarge: String? = nil
    ) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
        self.small = small
        self.medium = medium
        self.large = large
        self.extraLarge = extraLarge
    } // -> init
} // -> ImageLinks

struct AccessInfo: Codable {
    let webReaderLink: String?
    
    init(webReaderLink: String? = nil) {
        self.webReaderLink = webReaderLink
    } // -> init
} // -> AccessInfo
