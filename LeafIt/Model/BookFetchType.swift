//
//  BookFetchType.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import Foundation

enum BookFetchType: String, CaseIterable {
    case fantasy = "Fantasy"
    case romance = "Romance"
    case drama = "Drama"
    case mystery = "Mystery"
    case fiction = "Fiction"
    case nonfiction = "Non-Fiction"
    case biography = "Biography"
    case query = "Query"
    
    var urlParameter: String {
        switch self {
            case .fantasy: return "fantasy"
            case .romance: return "romance"
            case .drama: return "drama"
            case .mystery: return "mystery"
            case .fiction: return "fiction"
            case .nonfiction: return "nonfiction"
            case .biography: return "biography"
            default: return "*"
        }
    }
//    case query
}
