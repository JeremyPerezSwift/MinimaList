//
//  ProgressBar2.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import SwiftUI

struct ProgressBar2: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geo.size.width, height: geo.size.height)
                    .opacity(1)
                    .foregroundColor(Color("SilverList"))
                
                Rectangle().frame(width: self.getProgressWidth(geo: geo), height: geo.size.height)
                    .foregroundColor(Color("RedList"))
                    .animation(.linear)
            }
            .cornerRadius(10)
//            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
    }
    
    private func getProgressWidth(geo: GeometryProxy) -> CGFloat {
        return min(CGFloat(self.value) * geo.size.width, geo.size.width)
    }
}

struct ProgressBar2_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar2(value: .constant(0.5))
    }
}
