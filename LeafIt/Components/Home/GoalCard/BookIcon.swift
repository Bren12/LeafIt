//
//  BookIcon.swift
//  LeftIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 09/12/24.
//

import SwiftUI
import SwiftData

struct BookIcon: View {
    
    @Environment(\.modelContext) private var context
    @Query private var streak: [DBStreak]
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .foregroundStyle(.secondaryPurple)
            
            VStack {
                
                ZStack {
                    
                    Image(.openBook)
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                            
                        HStack(alignment: .center, spacing: 0) {
                            
                            Spacer()
                                .frame(width: 25, height: 25)
                            
                            Text("\(streak.first?.currentStreak ?? 0)")
                                .foregroundStyle(.primaryBlack)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 25, height: 25)
                                .task {
                                    if streak.isEmpty {
                                        createDefaultStreak()
                                    } // -> if
                                } // -> task

                        } // -> HStack
                        
                        Spacer()
                            .frame(height: 4)
                        
                    } // -> VStack
                    
                } // -> ZStack
                
            } // -> VStack
            
        } // -> ZStack
        .frame(width: 60, height: 60)
        
    } // -> body
        
    func createDefaultStreak() {
        let newStreak = DBStreak()
        context.insert(newStreak)
        do {
            try context.save()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> createDefaultStreak
    
} // -> BookIcon

#Preview {
    BookIcon()
} // -> Preview
