//
//  LibraryView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 13/12/24.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    
    @Environment(\.modelContext) private var context

    @State private var searchInput: String = ""
    @State private var lists: [DBList] = []
    @State private var showSheet: Bool = false
    
    @FocusState private var isFocused: Bool

    var body: some View {

        NavigationStack {

            ZStack {

                Color.primaryWhite

                VStack {

                    // MARK: SEARCH BAR
                    SearchBar(searchInput: $searchInput, isFocused: $isFocused) {
                        filteredLists()
                    } // -> SearchBar
                    
                    Spacer()

                    // MARK: AMOUNT OF BOOKS
                    HStack {
                        Text("\(lists.count) lists")
                            .foregroundStyle(.primaryGray)
                            .font(.system(size: 10, weight: .regular))
                        Spacer()
                    } // -> HStack
                    .padding(.top, 7.5)

                    // MARK: LISTS
                    ListView(lists: lists)

                } // -> VStack
                .padding(.horizontal)

                // MARK: BUTTON
                AddButton(showSheet: $showSheet)
                    .zIndex(1)

            } // -> ZStack
            .onAppear {
                isFocused = true
                filteredLists()
            } // -> onAppear
            .onTapGesture {
                isFocused = false
            } // -> onTapGesture
        } // -> NavigationVStack
        .sheet(isPresented: $showSheet) {
            AddListSheet(showSheet: $showSheet) {
                filteredLists()
            } // -> AddListSheet
                .presentationDetents([.fraction(0.358)])
        } // -> sheet
        
    } // -> body
    
    func filteredLists() {
        // Remove white spaces and new lines at the beginning and at the end of the string
        let filteredSearch = searchInput.trimmingCharacters(in: .whitespacesAndNewlines)
        let descriptor: FetchDescriptor<DBList>
        
        if filteredSearch.isEmpty {
            descriptor = FetchDescriptor<DBList>(sortBy: [.init(\.dateCreated)])
        } else {
            descriptor = FetchDescriptor<DBList>(
                predicate: #Predicate { $0.name.localizedStandardContains(filteredSearch) },
                sortBy: [.init(\.dateCreated)]
            ) // -> descriptor
        } // -> if-else
        
        do {
            lists = try context.fetch(descriptor)
        } catch {
            lists = []
            print("Error fetching filtered lists: \(error)")
        } // -> do-catch
    } // -> filteredLists

} // -> LibraryView

#Preview {
    LibraryView()
} // -> Preview
