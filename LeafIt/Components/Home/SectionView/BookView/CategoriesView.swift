//
//  CategoriesView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/04/25.
//

import SwiftUI

struct CategoriesView: View {
    
    let categories: [String]
    
    var body: some View {
        CustomScrollView(isVertical: false, limitSize: 0) {
            HStack(spacing: 15) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .foregroundStyle(.accent)
                        .font(.system(size: 17.5, weight: .regular))
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.accent, lineWidth: 1)
                        } // Text.overlay
                } // -> ForEach
            } // -> HStack
            .frame(height: 35)
        } // -> CustomScrollView
        .frame(height: 35)
    } // -> body
} // -> CategoriesView

#Preview {
    CategoriesView(categories: ["category 1"])
} // -> Preview
