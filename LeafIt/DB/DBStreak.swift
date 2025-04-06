//
//  DBStreak.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 02/04/25.
//

import Foundation
import SwiftData

@Model
class DBStreak: Identifiable {
    var streakId: UUID = UUID()
    var currentStreak: Int
    var longestStreak: Int
    var lastUpdated: Date

    init(
        currentStreak: Int = 0,
        longestStreak: Int = 0,
        lastUpdated: Date = Calendar.current.startOfDay(for: Date())
    ) {
        self.currentStreak = currentStreak
        self.longestStreak = longestStreak
        self.lastUpdated = lastUpdated
    } // -> init
} // -> DBStreak
