//
//  Home.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct Home: View {
    @StateObject private var listListViewModel = ListListViewModel()
    @ObservedObject var themeColor: ThemesColors
    
    @Binding var refreshList: Bool
    
//    init() {
//        UITableView.appearance().backgroundColor = .clear
//        UITableView.appearance().separatorStyle = .none
//        UITableViewCell.appearance().backgroundColor = .clear
//        UITableViewCell.appearance().selectionStyle = .none
//    }
    
    private func deleteList2(list: ListViewModel) {
        listListViewModel.deleteMovie(list_P: list)
        listListViewModel.getAllMovies(typeCompleted: false)
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("Enum To-Do")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("BlackList"))
                    
                    Spacer(minLength: 0)
                }
                .foregroundColor(.black)
                .padding(.top, 10)
                .padding()
                .padding(.horizontal, 10)
                
                HStack {
                    Text("List of todo")
                        .font(.title3)
                    
                    Spacer(minLength: 0)
                    
                    Menu {
                        
                        Button {
                            listListViewModel.filterListByDate(lists: listListViewModel.lists)
                        } label: {
                            Text("By date")
                        }
                        
                        Button {
                            listListViewModel.filterListByTitle(lists: listListViewModel.lists)
                        } label: {
                            Text("By title")
                        }
                        
                        Button {
                            listListViewModel.filterListByCompleted(lists: listListViewModel.lists)
                        } label: {
                            Text("By completed")
                        }

                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.body)
                            .foregroundColor(themeColor.color)
                        //ThemesColors.shared.color
                    }
                    .frame(width: 40, height: 40)
                    .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                }
                .foregroundColor(.black)
                .padding(.top, 0)
                .padding()
                .padding(.horizontal, 10)
                
                
                List {
                    ForEach(listListViewModel.lists, id: \.id) { list in
                        ZStack(alignment: .leading) {
                            
                            
                            ListView2(list: list, themeColor: themeColor)
                                .padding(.vertical, 10)
                            
                            NavigationLink(
                                destination: ToDo(themeColor: themeColor, list: list),
                                label: {
                                    ListView2(list: list, themeColor: themeColor)
                                        .padding(.vertical, 10)
                                })
                                .transition(.opacity)
                                .opacity(0)
                            
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
                                deleteList2(list: list)
                            } label: {
                                Image("delete")
                                    .font(.body)
                            }
                            .tint(.clear)
                            
                        }
                        
                    }
                    
//                    .onDelete(perform: deleteList)
                    

                }
                .listStyle(PlainListStyle())
                .onAppear {
                    listListViewModel.getAllMovies(typeCompleted: false)
                }
                
                
            }
            
            if listListViewModel.lists.count == 0 {
                ModalBgView()
            }
//            .padding()
        }
        .onChange(of: refreshList, perform: { newValue in
            listListViewModel.getAllMovies(typeCompleted: false)
        })
        .background(Color("MercuryList"))
        
    }
}
