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
    @ObservedObject var themeColor: ThemesColors
    
    let list: ListViewModel
    
    @State var isShowPopUp = false
    @State var isCheckPopup = false
    
    private func deleteTodo2(todoViewModel: TodoViewModel) {
        todoListVM.deleteTodo(todo_P: todoViewModel)
        todoListVM.getTodosByList(vm: list)
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
                                .foregroundColor(themeColor.color)
                        }
                        .frame(width: 40, height: 40)
                        
                        Spacer()
                        
                        Text(list.title)
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
                                .foregroundColor(Color("MercuryList"))
                        }
                        .frame(width: 40, height: 40)
                        .neumorphicEffect(fillColor: themeColor.color, cornerRdius: 10)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text(todoListVM.progressDisplayValue)
                                .font(.title3)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                            
                            Menu {
                                
                                Button {
                                    todoListVM.filterTodoByDate(todos: todoListVM.todos)
                                    todoListVM.filterCheck = .date
                                } label: {
                                    Text("By date")
                                }
                                
                                Button {
                                    todoListVM.filterTodoByTitle(todos: todoListVM.todos)
                                    todoListVM.filterCheck = .title
                                } label: {
                                    Text("By title")
                                }
                                
                                Button {
                                    todoListVM.filterTodoByCompleted(todos: todoListVM.todos)
                                    todoListVM.filterCheck = .completed
                                } label: {
                                    Text("By completed")
                                }

                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.body)
                                    .foregroundColor(themeColor.color)
                            }
                            .frame(width: 40, height: 40)
                            .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                        
                        HStack {
                            ProgressBar2(value: $todoListVM.progressValue, themeColor: themeColor)
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
                                CheckboxView(isChecked: todo.completed, themeColor: themeColor, ontap: { isChecked in
                                    self.todoListVM.toggleComplete(todo: todo, isChecked: isChecked)
                                    self.todoListVM.getTodosByListWithCheck(vm: list)
                                    isCheckPopup = true
                                    
                                    if isChecked {
                                        HapticsManager.shared.vibrateImpact(for: 1, impact: .light)
                                    }
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
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    deleteTodo2(todoViewModel: todo)
                                } label: {
                                    Image("delete")
                                        .font(.body)
                                }
                                .tint(.clear)
                                
                            }
                            
                        }
//                        .onDelete(perform: deleteTodo)

                    }
                    .listStyle(PlainListStyle())
                    
                }
                
                if todoListVM.progressValue == 1 && isCheckPopup == true {
                    ModalView()
                        .onTapGesture {
                            isCheckPopup = false
                            todoListVM.updateCompletedList(vm: list)
                            todoListVM.toggleAllTodoComplete(todos: todoListVM.todos)
                            presentationMode.wrappedValue.dismiss()
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
            AddToDo(themeColor: themeColor, list: list)
        }
    }
}

//struct ToDo_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDo()
//    }
//}
