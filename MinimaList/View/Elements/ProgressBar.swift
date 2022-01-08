//
//  ProgressBar.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    @ObservedObject var themeColor: ThemesColors
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geo.size.width, height: geo.size.height)
                    .opacity(1)
                    .foregroundColor(themeColor.colorAlpha)
                
                Rectangle().frame(width: self.getProgressWidth(geo: geo), height: geo.size.height)
                    .foregroundColor(themeColor.color)
                    .animation(.linear)
            }
//            .cornerRadius(10)
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
    }
    
    private func getProgressWidth(geo: GeometryProxy) -> CGFloat {
        return min(CGFloat(self.value) * geo.size.width, geo.size.width)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0.5), themeColor: ThemesColors())
    }
}
