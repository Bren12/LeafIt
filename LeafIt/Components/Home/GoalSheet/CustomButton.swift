//
//  CustomButton.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import SwiftUI

struct CustomButton: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .foregroundStyle(.primaryWhite)
            .font(.system(size: 17, weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(color)
            .cornerRadius(10)
    } // -> body
    
} // -> CustomButton

#Preview {
    CustomButton(text: "Save", color: .accent)
} // -> Preview
