//
//  ListViewModel.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation
import CoreData

class ListListViewModel: ObservableObject {
    @Published var lists = [ListViewModel]()
    
    func getAllMovies(typeCompleted: Bool) {
        lists.removeAll()
        print("DEBUG: getAllMovies")
        let lists: [ListModel] = ListModel.all()
        DispatchQueue.main.async {
            let lists_M = lists.map(ListViewModel.init)
            let listFilter = lists_M.sorted { $0.publishedAt > $1.publishedAt }
            
            for list in listFilter {
                if list.completed == typeCompleted {
                    self.lists.append(list)
                }
            }
        }
    }
    
    func deleteMovie(list_P: ListViewModel) {
        let list: ListModel? = ListModel.byId(id: list_P.id)
        if let list = list {
            list.delete()
        }
    }
    
    func updateCompletedList(vm: ListViewModel) {
        let list: ListModel? = ListModel.byId(id: vm.id)
        if let list = list {
            list.completed = false
            
            list.save()
        }
    }
    
    func filterListByDate(lists: [ListViewModel]) {
        let listFilter = lists.sorted { $0.publishedAt > $1.publishedAt }
        print("DEBUG: listFilter \(listFilter)")
        self.lists = listFilter
    }
    
    func filterListByTitle(lists: [ListViewModel]) {
        let listFilter = lists.sorted { $0.title < $1.title }
        print("DEBUG: listFilter \(listFilter)")
        self.lists = listFilter
    }
    
    func filterListByCompleted(lists: [ListViewModel]) {
        let listFilter = lists.sorted { $0.progressValue < $1.progressValue }
        print("DEBUG: listFilter \(listFilter)")
        self.lists = listFilter
    }
    
}

struct ListViewModel {
    let list: ListModel
    
    var id: NSManagedObjectID {
        return list.objectID
    }
    
    var title: String {
        return list.title ?? ""
    }
    
    var completed: Bool {
        return list.completed
    }
    
    var progressValue: Float {
        return list.progressValue
    }
    
    var progressDisplayValue: String {
        return progressValue > 0.0 ? "\(Int(progressValue * 100)) %" : "0%"
    }
    
    var publishedAt: Date {
        return list.publishedAt ?? Date()
    }
    
}
