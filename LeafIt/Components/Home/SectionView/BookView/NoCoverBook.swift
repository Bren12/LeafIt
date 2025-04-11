//
//  NoCoverBook.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/04/25.
//

import SwiftUI

struct NoCoverBook: View {
    var body: some View {
        VStack {
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 75)
            Text("Cover Not Available")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
        } // -> VStack
        .foregroundStyle(.accent)
        .frame(width: 150, height: 200)
        .background(.white)
        .cornerRadius(10)
    }
}

#Preview {
    NoCoverBook()
}
