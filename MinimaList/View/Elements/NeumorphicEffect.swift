//
//  NeumorphicEffect.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct NeumorphicEffect: ViewModifier {
    var fillColor: Color
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(fillColor)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 4, y: 4)
                .shadow(color: Color.white.opacity(1), radius: 6, x: -4, y: -4)
        )
    }
}

extension View {
    func neumorphicEffect(fillColor: Color, cornerRdius: CGFloat) -> some View {
        self.modifier(NeumorphicEffect(fillColor: fillColor, cornerRadius: cornerRdius))
    }
}
