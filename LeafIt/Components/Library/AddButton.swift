//
//  AddButton.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 12/04/25.
//

import SwiftUI

struct AddButton: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.accentColor)
                        .background(.primaryWhite)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding(.trailing)
                        .padding(.bottom)
                } // -> Button
            } // -> HStack
        } // -> VStack
        
    } // -> body
    
} // -> AddButton

#Preview {
    AddButton(showSheet: .constant(false))
} // -> Preview
