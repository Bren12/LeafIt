//
//  GoalSheet.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 16/12/24.
//

import SwiftUI
import SwiftData

struct GoalSheet: View {
    
    @Environment(\.modelContext) private var context
    @Query(
        filter: DBGoalAttempt.currentGoal(),
        sort: \DBGoalAttempt.endDate
    ) var activeGoals: [DBGoalAttempt]
    
    @State private var periodSelected: Period = .month
    @State private var bookCompleted: String = ""
    @State private var bookGoal: String = ""
    @State private var isReadInputValid: Bool = true
    @State private var isGoalInputValid: Bool = true
    @State private var endDate: Date = Calendar.current.date(
        byAdding: .month,
        value: 1,
        to: Calendar.current.startOfDay(for: Date())
    ) ?? Date()
    
    @Binding var showSheet: Bool
    @Binding var selectedDetent: PresentationDetent
    
    let startDate: Date = Calendar.current.startOfDay(for: Date())
    
    var body: some View {
        
        ZStack {
            
            Color.primaryWhite
            
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 30)
                
                // MARK: TITLE
                Text("📚 Goal Progress 📚")
                    .foregroundStyle(.primaryBlack)
                    .font(.system(size: 30, weight: .heavy))
                
                Text("From \(DateFormatter.dateStyle.string(from: startDate)) - \( (periodSelected != .lifetime) ? DateFormatter.dateStyle.string(from: endDate) : "∞")")
                    .foregroundStyle(.primaryGray)
                    .font(.system(size: 15))
                
                Spacer()
                    .frame(height: 15)
                
                Divider()
                
                Spacer()
                    .frame(height: 20)
                
                // MARK: TIME LAPSE
                if activeGoals.first == nil {
                    PeriodSelection(periodSelected: $periodSelected, endDate: $endDate, selectedDetent: $selectedDetent, startDate: startDate)
                } // -> if
                
                // MARK: BOOKS COMPLETED
                HStack(alignment: .bottom) {
                    CustomTextField(
                        title: "How many books have you read?",
                        placeholder: "Ex. 2",
                        isPadNumeric: true,
                        isInputValid: isReadInputValid,
                        textInput: $bookCompleted
                    ) // -> CustomTextField
                    .onChange(of: bookCompleted) { (_,_) in
                        let digitsOnly = bookCompleted.filter { $0.isNumber }
                        if let intValue = Int(digitsOnly), intValue >= 0 {
                            bookCompleted = String(intValue)
                        } else {
                            bookCompleted = ""
                        } // -> if-else
                    } // -> TextField.onChange
                    
                    if !activeGoals.isEmpty {
                        Text("/ \(bookGoal)")
                            .foregroundStyle(.primaryBlack)
                            .font(.system(size: 17, weight: .bold))
                            .padding(.bottom, 7)
                    } // -> if
                } // -> HStack

                Spacer()
                    .frame(height: 20)

                Divider()

                Spacer()
                    .frame(height: 20)

                // MARK: BOOKS GOAL
                if activeGoals.isEmpty {
                    CustomTextField(
                        title: "How many books do you want to read?",
                        placeholder: "Ex. 9",
                        isPadNumeric: true,
                        isInputValid: isGoalInputValid,
                        textInput: $bookGoal
                    ) // -> CustomTextField
                        .onChange(of: bookGoal) { (_,_) in
                            bookGoal = bookGoal.filter { $0.isNumber }
                                .replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
                        } // -> TextField.onChange

                    Spacer()
                        .frame(height: 20)

                    Divider()

                    Spacer()
                        .frame(height: 20)
                } // -> if
                
                // MARK: BUTTONS
                HStack {
                    if let currentGoal = activeGoals.first, currentGoal.booksCompleted < currentGoal.booksGoal {
                        Button {
                            deleteGoal(goal: currentGoal)
                        } label: {
                            CustomButton(text: "Delete", color: .primaryRed)
                        } // -> Button
                    } // -> if

                    Button {
                        if activeGoals.isEmpty {
                            createGoal()
                        } else {
                            updateGoal()
                        } // -> if-else
                    } label: {
                        CustomButton(text: "Save", color: .accent)
                    } // -> Button
                } // -> HStack
                
                Spacer()
                
            } // -> VStack
            .padding(.horizontal)
            
        } // -> ZStack
        .onAppear { loadData() }
        
    } // -> body
    
    // MARK: loadData
    func loadData() {
        if let goal = activeGoals.first {
            bookCompleted = String(goal.booksCompleted)
            bookGoal = String(goal.booksGoal)
            selectedDetent = .fraction(0.383)
        } // -> if
    } // -> loadData
    
    // MARK: createGoal
    func createGoal() {
        guard activeGoals.isEmpty else { return }
        guard let intBookCompleted = Int(bookCompleted) else {
            isReadInputValid = false
            isGoalInputValid = Int(bookGoal) != nil
            return
        } // -> guard
        guard let intBookGoal = Int(bookGoal), intBookGoal > intBookCompleted else {
            isReadInputValid = true
            isGoalInputValid = false
            return
        } // -> guard
        isReadInputValid = true
        isGoalInputValid = true
        let newGoal = DBGoalAttempt(booksCompleted: intBookCompleted, booksGoal: intBookGoal, period: periodSelected, endDate: endDate)
        context.insert(newGoal)
        do {
            print("CREATED")
            try context.save()
            showSheet.toggle()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> createGoal

    // MARK: updateGoal
    func updateGoal() {
        guard
            !activeGoals.isEmpty,
            let intBookCompleted = Int(bookCompleted)
            else { return }
        activeGoals[0].booksCompleted = intBookCompleted
        do {
            showSheet.toggle()
            selectedDetent = .fraction(0.65)
            try context.save()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> updateGoal

    // MARK: deleteGoal
    func deleteGoal(goal: DBGoalAttempt) {
        context.delete(goal)
        do {
            showSheet.toggle()
            selectedDetent = .fraction(0.65)
            try context.save()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> deleteGoal
    
} // -> GoalSheetView

#Preview {
    GoalSheet(showSheet: .constant(true), selectedDetent: .constant(.fraction(0.65)))
} // -> Preview
