//
//  ReadingView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 06/04/25.
//

import SwiftUI

struct ReadingView: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("You are reading...")
                    .foregroundStyle(.primaryBlack)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
            } // -> HStack
            
            HStack {
                Spacer()
//                Carousel(viewModel: CarouselStoreModel(bookList: viewModel.books ?? []), observedModel: viewModel, showSheet: $showContinueSheet, bookGB: $bookGB)
                Spacer()
            } // -> HStack
        } // -> VStack
        
    } // -> body
    
} // -> ReadingView

#Preview {
    ReadingView()
} // -> Preview
