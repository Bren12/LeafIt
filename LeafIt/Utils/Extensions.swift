//
//  Extensions.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import Foundation

extension DateFormatter {
    static var dateStyle: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    } // -> dateFormat
}
