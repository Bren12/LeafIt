//
//  DescriptionView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/04/25.
//

import SwiftUI

struct DescriptionView: View {
    
    let description: String
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment: .topLeading) {
                
                CustomRectangle(cornerRadius: 25, cutRadius: 0)
                    .foregroundStyle(.white)
                    .frame(maxHeight: .infinity)
                CustomScrollView(isVertical: true, limitSize: geo.size.height) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .foregroundStyle(.primaryBlack)
                            .font(.system(size: 25, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 5)
                        if !description.isEmpty {
                            Text(description)
                                .foregroundStyle(.primaryBlack)
                                .font(.system(size: 17.5))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Text("Description not available. Looks like this book is keeping its secrets for now.")
                                .foregroundStyle(.primaryBlack)
                                .font(.system(size: 17.5))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } // -> if-else
                        Spacer()
                    } // -> VStack
                } // -> CustomScrollView
                .padding()
                
            } // -> ZStack
            
        } // -> GeometryReader
        
    } // -> body
    
} // -> DescriptionView

#Preview {
    DescriptionView(description: "")
} // -> Preview
