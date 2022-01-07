//
//  CheckBoxView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct CheckboxView: View {
    @State var isChecked: Bool
    var ontap: (_ isChecked: Bool) -> Void
    
    let todo: TodoViewModel
    
    func toggle() {
        self.isChecked.toggle()
        self.ontap(self.isChecked)
    }
    
    var body: some View {
        
        HStack {
            Button(action: toggle) {
                HStack {
                    Image(systemName: isChecked ? "checkmark" : "minus").frame(width: 25, height: 25)
                        .foregroundColor(Color("RedList"))
                }
            }
            .frame(width: 30, height: 30)
            .background(Color("MercuryList"))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("RedList"), lineWidth: 2)
            )
            
            
            Text(todo.title)
                .padding(.horizontal, 10)
            
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: 60)
//        .foregroundColor(Color("BlackList"))
        .foregroundColor(isChecked ? Color("MercuryList") : Color("BlackList"))
        .background(isChecked ? Color("RedList") : Color("MercuryList"))
        .cornerRadius(15)
        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 30)
        .listRowBackground(Color.clear)
        .listRowSeparatorTint(Color.clear)
    }
}

