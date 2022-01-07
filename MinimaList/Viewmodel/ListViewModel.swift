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
    
    func getAllMovies() {
        lists.removeAll()
        print("DEBUG: getAllMovies")
        let lists: [ListModel] = ListModel.all()
        DispatchQueue.main.async {
            let lists_M = lists.map(ListViewModel.init)
            
            for list in lists_M {
                if list.completed == false {
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
    
}
