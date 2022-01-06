//
//  ListView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Text("Liste pour Disney")
                    .font(.title3)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .padding(.top, 8)
            
                Spacer()
            }
            
            Text("60%")
                .padding(.top, 10)
            
            ProgressBar(value: .constant(0.6))
                .frame(height: 20)
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: 160)
        .foregroundColor(Color("BlackList"))
        .background(Color("MercuryList"))
        .cornerRadius(15)
        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 30)
        .listRowBackground(Color.clear)
        .listRowSeparatorTint(Color.clear)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
