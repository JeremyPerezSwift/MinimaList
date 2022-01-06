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
        
        print("DEBUG: getAllMovies")
        let lists: [ListModel] = ListModel.all()
        DispatchQueue.main.async {
            self.lists = lists.map(ListViewModel.init)
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
    
    
}
