//
//  AddListSheet.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 12/04/25.
//

import SwiftUI
import SwiftData

struct AddListSheet: View {
    
    @Environment(\.modelContext) private var context
    @Query var lists: [DBList]
    
    @Binding var showSheet: Bool
    
    @State private var listName: String = ""
    @State private var isInputValid: Bool = true
    
    var filteredLists: () -> Void = { }
    
    var body: some View {
        
        ZStack {
            
            Color.primaryWhite
            
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 30)
                
                // MARK: TITLE
                Text("📚 New List 📚")
                    .foregroundStyle(.primaryBlack)
                    .font(.system(size: 30, weight: .heavy))
                
                Spacer()
                    .frame(height: 15)
                
                Divider()
                
                Spacer()
                    .frame(height: 20)
                
                // MARK: BOOKS COMPLETED
                CustomTextField(
                    title: "Enter a name for your book list",
                    placeholder: "Ex. Wishlist",
                    isPadNumeric: false,
                    isInputValid: isInputValid,
                    textInput: $listName
                ) // -> CustomTextField

                Spacer()
                    .frame(height: 20)

                Divider()

                Spacer()
                    .frame(height: 20)
                
                // MARK: BUTTON
                Button {
                    isInputValid = isValidInput()
                    if isInputValid {
                        createList()
                    } // -> if
                } label: {
                    CustomButton(text: "Create", color: .accent)
                } // -> Button
                
                Spacer()
                
            } // -> VStack
            .padding(.horizontal)
            
        } // -> ZStack
        
    } // -> body
    
    // MARK: createList
    func createList() {
        let newList = DBList(name: listName, dateCreated: Date.now)
        context.insert(newList)
        do {
            print("CREATED")
            try context.save()
            showSheet.toggle()
            filteredLists()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> createGoal

    // MARK: isValidInput
    func isValidInput() -> Bool {
        guard !listName.isEmpty else { return false }
        if lists.filter({ $0.name == listName }).isEmpty { return true }
        return false
    } // -> isValidInput
}

#Preview {
    AddListSheet(showSheet: .constant(true))
} // -> Preview
