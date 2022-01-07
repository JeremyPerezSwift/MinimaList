//
//  Home.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct Home: View {
    @StateObject private var listListViewModel = ListListViewModel()
    
    @Binding var refreshList: Bool
    
//    init() {
//        UITableView.appearance().backgroundColor = .clear
//        UITableView.appearance().separatorStyle = .none
//        UITableViewCell.appearance().backgroundColor = .clear
//        UITableViewCell.appearance().selectionStyle = .none
//    }
    
    private func deleteList(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let list = listListViewModel.lists[index]
            listListViewModel.deleteMovie(list_P: list)
            listListViewModel.getAllMovies()
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("MinimaList")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
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
                    
                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.body)
                            .foregroundColor(Color("RedList"))
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
                            ListView2(list: list)
                                .padding(.vertical, 10)
                            
                            NavigationLink(
                                destination: ToDo(list: list),
                                label: {
                                    ListView2(list: list)
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
                    }
                    .onDelete(perform: deleteList)

                }
                .listStyle(PlainListStyle())
                .onAppear {
                    listListViewModel.getAllMovies()
                }
                
            }
//            .padding()
        }
        .onChange(of: refreshList, perform: { newValue in
            listListViewModel.getAllMovies()
        })
        .background(Color("MercuryList"))
        
    }
}
