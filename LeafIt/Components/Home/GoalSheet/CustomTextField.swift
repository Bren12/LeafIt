//
//  CustomTextField.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    let placeholder: String
    let isPadNumeric: Bool
    let isInputValid: Bool
    
    @Binding var textInput: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.primaryBlack)
                .font(.system(size: 18, weight: .bold))
            
            ZStack(alignment: .leading) {
                if textInput.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.secondaryGray)
                        .padding(.leading)
                } // -> if
                
                TextField("", text: $textInput)
                    .foregroundStyle(.primaryBlack)
                    .font(.system(size: 17))
                    .frame(height: 30)
                    .padding(.leading)
                    .keyboardType(isPadNumeric ? .numberPad : .default)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(isInputValid ? .secondaryGray : .primaryRed, lineWidth: 1)
                            .animation(.easeInOut, value: isInputValid)
                    } // -> TextField.overlay
                
            } // -> ZStack
        } // -> VStack
        
    } // -> body
    
} // -> CustomTextField

#Preview {
    CustomTextField(title: "How many books have you read?", placeholder: "Ex. 2", isPadNumeric: true, isInputValid: true, textInput: .constant(""))
}
