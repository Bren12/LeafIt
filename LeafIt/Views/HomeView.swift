//
//  HomeView.swift
//  LeftIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 09/12/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<DBBook> {
            $0.lists.contains(where: { $0.name == defaultListName })
    }) private var booksReading: [DBBook]
    
    @State private var selectedDetent: PresentationDetent = .fraction(0.65)
    
    @State var showSheet = false
    @State var showContinueSheet = false
    @State var bookGB = ""
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.primaryWhite
                
                ScrollView {
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 15)
                        
                        // MARK: DEFAULT GREETING
                        HStack {
                            Text(defaultGreeting)
                                .foregroundStyle(.primaryGray)
                                .font(.system(size: 17.5))
                            Spacer()
                        } // -> HStack
                        
                        // MARK: GREETING USER
                        HStack {
                            Text("\(readerUser)")
                                .foregroundStyle(.primaryBlack)
                                .font(.system(size: 25, weight: .semibold))
                            Spacer()
                        } // -> HStack
                        
                        // MARK: GOALCARD
                        GoalCard(showSheet: $showSheet)
                        
                        Spacer()
                            .frame(height: 30)
                        
                        // MARK: READING (EMPTY/CARROUSEL)
                        if booksReading.isEmpty {
                            EmptyReadingView(selectedTab: $selectedTab)
                        } else {
                            ReadingView()
                        } // -> if-else
                        
                        // MARK: BookView
                        ForEach(BookFetchType.allCases, id: \.self) { type in
                            Spacer()
                                .frame(height: 20)
                            SectionBookView(type: type)
                        } // -> ForEach
                        
                        Spacer()
                            .frame(height: 100)
                        
                    } // -> VStack
                    .padding(.horizontal)
                    
                } // -> ScrollView
                .scrollIndicators(.hidden)
                
            } // -> ZStack
            // MARK: GoalSheet
            .sheet(isPresented: $showSheet) {
                GoalSheet(showSheet: $showSheet, selectedDetent: $selectedDetent)
                    .presentationDetents([selectedDetent])
            } // -> sheet
            // MARK: ContinueReadingSheetView
//            .sheet(isPresented: $showContinueSheet) {
//                ContinueReadingSheetView(showSheet: $showContinueSheet, bookGB: $bookGB)
//                    .presentationDetents([.medium])
//            } // -> sheet
            
        } // -> NavigationStack
        
    } // -> body
    
} // -> HomeView

#Preview {
    HomeView(selectedTab: .constant(.home))
} // -> Preview
