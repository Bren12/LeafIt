//
//  GoalCard.swift
//  LeftIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 09/12/24.
//

import SwiftUI
import SwiftData

struct GoalCard: View {
    
    @Environment(\.modelContext) private var context
    @Query(
        filter: DBGoalAttempt.currentGoal(),
        sort: \DBGoalAttempt.endDate
    ) var activeGoals: [DBGoalAttempt]
    
    @Binding var showSheet: Bool
    
    var body: some View {
            
        HStack {
            
            Spacer()
                .frame(width: 10)
            
            BookIcon()
            
            VStack(alignment: .leading) {
                
                Text("\(activeGoals.first?.period.appending(" ") ?? "")Goal Progress")
                    .foregroundStyle(.primaryBlack)
                    .font(.system(size: 17, weight: .medium))
                
                // MARK: CONDITION - IS GOAL SET?
                if let goal = activeGoals.first {
                    Text("\(goal.booksCompleted)")
                        .foregroundStyle(.accent)
                        .font(.system(size: 14, weight: .regular))
                    + Text(" / \(goal.booksGoal) \((goal.booksGoal == 1) ? "book" : "books")")
                        .foregroundStyle(.primaryGray)
                        .font(.system(size: 14, weight: .regular))
                } else {
                    Text("Let’s set a new goal!")
                        .foregroundStyle(.primaryGray)
                        .font(.system(size: 14, weight: .regular))
                } // -> if-else
                
            } // -> VStack
            
            Spacer()
            
            // MARK: SET/EDIT GOAL
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .foregroundStyle(.accent)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 7.5)
                    .background(.secondaryPurple)
                    .cornerRadius(5)
            } // -> Button
            
            Spacer()
                .frame(width: 10)
            
        } // -> HStack
        .padding(.vertical)
        .padding(.horizontal, 7.5)
        .background(.white)
        .cornerRadius(10)
        .shadow(
            radius: 4,
            y: 4
        ) // -> HStack.shadow
        
    } // -> body
    
} // -> GoalCard

#Preview {
    GoalCard(showSheet: .constant(false))
} // -> Preview

