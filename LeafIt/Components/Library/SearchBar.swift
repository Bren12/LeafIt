//
//  SearchBar.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 11/04/25.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchInput: String
    @FocusState.Binding var isFocused: Bool
    var filteredLists: () -> Void = { }
    
    var body: some View {
        
        HStack {
            
            Spacer()
                .frame(width: 15)

            Image(systemName: "magnifyingglass")
                .foregroundStyle(.terciaryGray)
                .frame(width: 12, height: 12)

            ZStack(alignment: .leading) {
                if searchInput.isEmpty {
                    Text("Search...")
                        .foregroundColor(.secondaryGray)
                } // -> if
                
                TextField("", text: $searchInput)
                    .foregroundStyle(.primaryBlack)
                    .focused($isFocused)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .onChange(of: searchInput) { filteredLists() }
            } // ZStack
            
        } // -> HStack
        .frame(height: 35)
        .background(.white)
        .cornerRadius(10)
        .padding(.top)
        .onTapGesture {
            isFocused = true
        } // -> onTapGesture
        
    } // -> body
    
} // -> SearchBar

#Preview {
    @Previewable @State var searchInput = ""
    @Previewable @FocusState var isFocused: Bool
    SearchBar(searchInput: $searchInput, isFocused: $isFocused)
} // -> Preview
