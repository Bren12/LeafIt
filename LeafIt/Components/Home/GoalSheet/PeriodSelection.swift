//
//  PeriodSelection.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import SwiftUI

struct PeriodSelection: View {
    
    @Binding var periodSelected: Period
    @Binding var endDate: Date
    @Binding var selectedDetent: PresentationDetent
    
    let startDate: Date
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Select a time period")
                .foregroundStyle(.primaryBlack)
                .font(.system(size: 18, weight: .bold))
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Period.allCases, id: \.self) { period in
                        Button {
                            periodSelected = period
                            switch periodSelected {
                            case .month:
                                endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate) ?? startDate
                                selectedDetent = .fraction(0.65)
                            case .year:
                                endDate = Calendar.current.date(byAdding: .year, value: 1, to: startDate) ?? startDate
                                selectedDetent = .fraction(0.65)
                            case .lifetime:
                                endDate = Calendar.current.startOfDay(for: Date())
                                selectedDetent = .fraction(0.65)
                            case .custom:
                                endDate = Calendar.current.startOfDay(for: Date())
                                selectedDetent = .fraction(0.7475)
                            }
                        } label: {
                            Text("\(period.rawValue)")
                                .foregroundStyle(periodSelected == period ? .primaryWhite : .accent)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 100, height: 30)
                                .background(periodSelected == period ? .accent : .clear)
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.accent, lineWidth: 1)
                                } // -> Text.overlay
                        } // -> Button
                    } // -> ForEach
                } // -> HStack
            } // -> ScrollView
            .scrollIndicators(.hidden)
            
            Spacer()
                .frame(height: 20)
            
            Divider()
            
            Spacer()
                .frame(height: 20)
            
            if periodSelected == .custom {
                DatePicker(
                    "Set your deadline",
                    selection: $endDate,
                    in:  Date()...,
                    displayedComponents: .date
                ) // -> DatePicker
                .foregroundStyle(.primaryBlack)
                .font(.system(size: 18, weight: .bold))
                
                Spacer()
                    .frame(height: 20)
                
                Divider()
                
                Spacer()
                    .frame(height: 20)
            } // -> if
            
        } // -> VStack
        
    } // -> body
    
} // -> PeriodSelection

#Preview {
    PeriodSelection(periodSelected: .constant(.month), endDate: .constant(Date()), selectedDetent: .constant(.fraction(0.65)), startDate: Date())
} // -> Preview
