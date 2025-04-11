//
//  Functions.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 07/04/25.
//

import Foundation

func languageName(code: String) -> String {
    switch code {
        case "en": return "English"
        case "es": return "Spanish"
        case "de": return "German"
        case "it": return "Italian"
        case "fr": return "French"
        default: return "Unknown"
    } // -> switch
} // -> languageName

func htmlToMarkdown(html: String) -> String {
    var result = html
    result = result.replacingOccurrences(of: "<b>", with: "**")
    result = result.replacingOccurrences(of: "</b>", with: "**")
    result = result.replacingOccurrences(of: "<i>", with: "*")
    result = result.replacingOccurrences(of: "</i>", with: "*")
    result = result.replacingOccurrences(of: " <br> ", with: " \n")
    result = result.replacingOccurrences(of: " <br>", with: " \n")
    result = result.replacingOccurrences(of: "<br> ", with: " \n")
    result = result.replacingOccurrences(of: "<br>", with: " \n")
    return result
} // -> htmlToMarkdown

//func splitCategories(categories: [String]) -> Dictionary {
//    var result: Set<String> = []
//    for value in categories {
//        let splitValue = value.split(separator: " / ")
//        result.insert(splitValue)
//    }
//    return result
//} // -> htmlToMarkdown
