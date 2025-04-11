//
//  BookWebImage.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/04/25.
//

import SwiftUI

struct BookWebImage: View {
    
    var thumbnail: String
    
    var body: some View {
        AsyncImage(url: URL(
            string: thumbnail.replacingOccurrences(of: "http://", with: "https://"))
        ) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                ) // -> clipShape
        } placeholder: {
            ProgressView()
        } // -> AsyncImage
        .frame(height: 200)
    }
}

#Preview {
    BookWebImage(thumbnail: "")
}
