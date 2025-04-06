//
//  EmptyReadingView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 05/04/25.
//

import SwiftUI

struct EmptyReadingView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        VStack {
            Image(.magicBook)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Spacer()
                .frame(height: 15)
            Text("Let's start a new journey!")
                .foregroundStyle(.gray)
                .font(.system(size: 20, weight: .medium))
            Spacer()
                .frame(height: 30)
        } // -> VStack
        
        Button {
            selectedTab =  .explore
        } label: {
            Text("Add book")
                .foregroundStyle(.primaryWhite)
                .font(.system(size: 20, weight: .semibold))
                .frame(width: 150, height: 45)
                .background(.accent)
                .cornerRadius(5)
        } // -> Button
        
    } // -> body
    
} // -> EmptyReadingView

#Preview {
    EmptyReadingView(selectedTab: .constant(.home))
} // -> Preview
