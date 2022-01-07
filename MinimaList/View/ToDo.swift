//
//  ToDo.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct ToDo: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var todoListVM = TodoListViewModel()
    let list: ListViewModel
    
    @State var isShowPopUp = false
    @State var isCheckPopup = false
    
    private func deleteTodo(at indexSet: IndexSet) {
        indexSet.forEach { index in
           let todo = todoListVM.todos[index]
            todoListVM.deleteTodo(todo_P: todo)
            todoListVM.getTodosByList(vm: list)
        }
    }
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(Color("RedList"))
                        }
                        .frame(width: 40, height: 40)
                        
                        Spacer()
                        
                        Text("List of todo")
                            .font(.title3)
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Button(action: {
                            isShowPopUp.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(.body)
                                .foregroundColor(Color("RedList"))
                        }
                        .frame(width: 40, height: 40)
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text(todoListVM.progressDisplayValue)
                                .font(.title3)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                        
                        HStack {
                            ProgressBar2(value: $todoListVM.progressValue)
                                .frame(height: 20)
        //                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                        }
                        .foregroundColor(.black)
                        .padding(.top, 0)
                        .padding()
                        .padding(.horizontal, 10)
                    }
                    
                    List {
                        
                        ForEach(todoListVM.todos, id: \.id) { todo in
                            
                            ZStack(alignment: .leading) {
                                CheckboxView(isChecked: todo.completed, ontap: { isChecked in
                                    self.todoListVM.toggleComplete(todo: todo, isChecked: isChecked)
                                    self.todoListVM.getTodosByListWithCheck(vm: list)
                                    isCheckPopup = true
//                                    if todoListVM.progressValue == 1 {
//                                        isCheckPopup.toggle()
//                                        print("DEBUG: progressValue true \(isCheckPopup)")
//                                    }
                                }, todo: todo)
                                    .padding(.vertical, 10)
                                
                            }
                            .listStyle(PlainListStyle())
                            .background(Color("MercuryList"))
                            .listRowBackground(Color.clear)
                            .listRowSeparatorTint(Color.clear)
                            .onAppear(perform: {
                                UITableView.appearance().separatorStyle = .none
                                UITableView.appearance().separatorColor = .clear
                            })
                            
                        }
                        .onDelete(perform: deleteTodo)

                    }
                    .listStyle(PlainListStyle())
                    
                }
                
                if todoListVM.progressValue == 1 && isCheckPopup == true {
                    ModalView()
                        .onTapGesture {
                            isCheckPopup = false
                            todoListVM.updateCompletedList(vm: list)
                        }
                }
                
            }
        }
        .background(Color("MercuryList"))
        .navigationBarHidden(true)
        .onAppear(perform: {
            todoListVM.getTodosByList(vm: list)
        })
        .sheet(isPresented: $isShowPopUp) {
            todoListVM.getTodosByList(vm: list)
        } content: {
            AddToDo(list: list)
        }
    }
}

//struct ToDo_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDo()
//    }
//}
