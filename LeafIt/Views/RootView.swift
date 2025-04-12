//
//  RootView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 13/12/24.
//

import SwiftUI
import SwiftData

struct RootView: View {
    
    @Environment(\.modelContext) private var context
    @Query var activeGoals: [DBList]
    
    @State private var showHomeView: Bool = false
    @State private var isTransitioning: Bool = false
    
    var body: some View {
        
        ZStack {
            
            CoverView()
                .opacity(isTransitioning ? 0 : 1)
            
            if showHomeView {
                TabBar()
                    .transition(.opacity)
                    .opacity(isTransitioning ? 1 : 0)
            } // -> if
            
        } // -> ZStack
        .onAppear {
            
            // After a brief delay, start the fading effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isTransitioning = true
                } // -> withAnimation
            } // -> DispatchQueue
            
            // After the fading effect, show the second view
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    showHomeView = true
                } // -> withAnimation
            } // -> DispatchQueue
            
            // Create default list if not exist
            createDefaultList()
            
        } // -> onAppear
        
    } // -> body
    
    func createDefaultList() {
        let descriptor = FetchDescriptor<DBList>(
            predicate: #Predicate { $0.name == "Now Reading" }
        ) // -> descriptor
        if let existing = try? context.fetch(descriptor), existing.isEmpty {
            let defaultList = DBList(name: "Now Reading", dateCreated: Date())
            context.insert(defaultList)
            do {
                try context.save()
            } catch {
                print("Failed to save: \(error)")
            } // -> do-try
        } // -> if
    } // -> createDefaultList
    
} // -> RootView

#Preview {
    RootView()
} // -> Preview
