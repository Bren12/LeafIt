//
//  HalfRectangle.swift
//  LeafIt
//
//  Created by Brenda Elena Saucedo Gonzalez on 08/04/25.
//

import SwiftUI

struct CustomRectangle: Shape {
    
    var cornerRadius: CGFloat
    var cutRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        // Left Upper Corner
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        
        // Upper Line
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        
        // Right Upper Corner
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(-90),
            endAngle: .degrees(0),
            clockwise: false
        ) // -> path-addArc
        
        // Right Line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Right Bottom Corner
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.maxY - cutRadius),
            radius: cutRadius,
            startAngle: .degrees(-90),
            endAngle: .degrees(-180),
            clockwise: true
        ) // -> path-addArc
        
        // Bottom Line
        path.addLine(to: CGPoint(x: rect.minX + cutRadius, y: rect.maxY - cutRadius))
        
        // Left Bottom Corner
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.maxY - cutRadius),
            radius: cutRadius,
            startAngle: .degrees(0),
            endAngle: .degrees(270),
            clockwise: true
        ) // -> path-addArc
        
        // Left Line
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        
        // Left Upper Corner
        path.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        ) // -> path-addArc
        
        path.closeSubpath()
        
        return path
        
    } // -> path
    
} // -> TicketShape
