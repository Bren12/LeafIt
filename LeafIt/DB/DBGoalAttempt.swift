//
//  DBGoal.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 02/04/25.
//

import Foundation
import SwiftData

@Model
class DBGoalAttempt: Identifiable {
    var goalId: UUID = UUID()
    var booksCompleted: Int
    var booksGoal: Int
    var period: String
    var startDate: Date
    var endDate: Date?

    init(
        booksCompleted: Int,
        booksGoal: Int,
        period: Period,
        startDate: Date = Calendar.current.startOfDay(for: Date()),
        endDate: Date? = nil
    ) {
        self.booksCompleted = booksCompleted
        self.booksGoal = booksGoal
        self.period = period.rawValue
        self.startDate = startDate
        self.endDate = endDate
    } // -> init
    
    static func currentGoal() -> Predicate<DBGoalAttempt> {
        let currentDate = Date.now
        return #Predicate<DBGoalAttempt> { goal in
            if let deadline = goal.endDate {
                goal.startDate <= currentDate && deadline >= currentDate
            } else {
                goal.startDate <= currentDate && goal.endDate == nil
            } // -> if-else
        } // -> return
    } // -> currentPredicate
    
} // -> DBGoalAttempt
