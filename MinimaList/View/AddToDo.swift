//
//  AddToDo.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import SwiftUI

struct AddToDo: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var themeColor: ThemesColors
    @StateObject private var addTodoViewModel = AddTodoViewModel()
    let list: ListViewModel
    
    @State var text = ""
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("New todo")
                        .font(.title)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                            .foregroundColor(themeColor.color)
                    }
                    .frame(width: 40, height: 40)
                    .padding()
                }
                
                HStack {
                    
                    TextField("Enter title", text: $text)
                        .padding()
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: 60)
                }
                .foregroundColor(.black)
                .padding(.vertical)
                
                HStack {
                    Button(action: {
                        if text != "" {
                            print("DEBUG: AddTodo \(text)")
                            addTodoViewModel.title = text
                            addTodoViewModel.addTodoForList(vm: list)
                            dismiss()
                        }
                    }) {
                        Text("Confirm")
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.white)
                            .neumorphicEffect(fillColor: themeColor.color, cornerRdius: 10)
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

//struct AddToDo_Previews: PreviewProvider {
//    static var previews: some View {
//        AddToDo()
//    }
//}
