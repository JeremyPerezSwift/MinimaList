//
//  AddList.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct AddList: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var addListViewModel = AddListViewModel()
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                            .foregroundColor(Color("RedList"))
                    }
                    .frame(width: 40, height: 40)
                    .padding()
                }
                
                HStack {
                    
                    TextField("Enter title", text: $addListViewModel.title)
                        .padding()
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: 60)
                }
                .foregroundColor(.black)
                .padding(.vertical)
                
                HStack {
                    Button(action: {
                        if addListViewModel.title != "" {
                            addListViewModel.save()
                            dismiss()
                        }
                    }) {
                        Text("Confirm")
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.white)
                            .neumorphicEffect(fillColor: Color("RedList"), cornerRdius: 10)
//                            .padding()
                    }
                    
                }
                .padding(.vertical)
                
                Spacer()
                
            }
        }
        .background(Color("MercuryList"))
    }
}

struct AddList_Previews: PreviewProvider {
    static var previews: some View {
        AddList()
    }
}
