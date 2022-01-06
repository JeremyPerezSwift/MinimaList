//
//  NeumorphicInterEffect.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import SwiftUI

struct NeumorphicInterEffect: ViewModifier {
    var fillColor: Color
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(fillColor, lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .shadow(color: Color.white.opacity(0.8), radius: 4, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            )
        
//        content.background(
//            RoundedRectangle(cornerRadius: cornerRadius)
//                .stroke(Color.black.opacity(0.05), lineWidth: 4)
//                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 4, y: 4)
//                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
//                .shadow(color: Color.white.opacity(1), radius: 6, x: -4, y: -4)
//                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
//                .background(fillColor)
//        )
    }
}

extension View {
    func neumorphicInterEffect(fillColor: Color, cornerRdius: CGFloat) -> some View {
        self.modifier(NeumorphicInterEffect(fillColor: fillColor, cornerRadius: cornerRdius))
    }
}
