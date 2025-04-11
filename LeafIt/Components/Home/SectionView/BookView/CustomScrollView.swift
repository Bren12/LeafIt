//
//  CustomScrollView.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 10/04/25.
//

import SwiftUI

struct CustomScrollView<Content: View>: View {
    
    let isVertical: Bool
    let limitSize: CGFloat
    
    @ViewBuilder let contentView: () -> Content
    
    @State private var content: CGFloat = 0
    @State private var container: CGFloat = 0

    var body: some View {
        
        GeometryReader { geo in
            
            Group {
                if container > content {
                    if isVertical {
                        innerContent
                            .frame(maxHeight: .infinity, alignment: .center)
                    } else {
                        innerContent
                            .frame(maxWidth: .infinity, alignment: .center)
                    } // -> if-else
                } else {
                    if isVertical {
                        ScrollView(.vertical, showsIndicators: false) {
                            innerContent
                        } // -> ScrollView
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            innerContent
                        } // -> ScrollView
                    } // -> if-else
                } // -> if-else
            }
            .onAppear {
                container = (limitSize == 0) ? (isVertical ? geo.size.height : geo.size.width) : limitSize
            } // -> HStack.onAppear
            
        } // -> GeometryReader
        
    } // -> body
    
    var innerContent: some View {
        contentView()
            .background (
                GeometryReader { geo in
                    Color
                        .clear
                        .onAppear {
                            content = isVertical ? geo.size.height : geo.size.width
                        } // -> Color.onAppear
                } // -> GeometryReader
            ) // -> background
    } // -> innerContent
    
} // -> CustomScrollView

//#Preview {
//    CustomScrollView<Content: View>(categories: ["String 1", "String 2", "String 3"])
//} // -> Preview
