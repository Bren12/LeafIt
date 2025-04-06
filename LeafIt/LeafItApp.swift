//
//  LeafItApp.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import SwiftUI
import SwiftData

@main
struct LeafItApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        } // -> WindowGroup
        .modelContainer(for: [DBStreak.self, DBGoalAttempt.self, DBBook.self])
    } // -> body
} // -> LeafItApp
