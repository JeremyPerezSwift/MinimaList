//
//  ListView2.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import SwiftUI

struct ListView2: View {
    let list: ListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Text(list.title)
                    .font(.title3)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .padding(.top, 8)
            
                Spacer()
                
                Image(systemName: "arrow.right")
                    .font(.title3)
                    .foregroundColor(Color("RedList"))
            }
            .padding()
            
            Text("60%")
                .padding(.top, 10)
                .padding(.horizontal)
            
            ProgressBar(value: .constant(0.6))
                .frame(height: 20)
//                .padding(.top)
            
        }
//        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1)
        .foregroundColor(Color("BlackList"))
        .background(Color("MercuryList"))
        .cornerRadius(15)
        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 30)
        .listRowBackground(Color.clear)
        .listRowSeparatorTint(Color.clear)
    }
}

//struct ListView2_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView2()
//    }
//}
