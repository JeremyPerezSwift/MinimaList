//
//  TodoListViewModel.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation
import CoreData

class TodoListViewModel: ObservableObject {
    
   @Published var todos = [TodoViewModel]()

    func getTodosByList(vm: ListViewModel) {
        DispatchQueue.main.async {
            self.todos = TodoModel.getTodoByListId(listId: vm.id).map(TodoViewModel.init)
        }
    }
    
}

struct TodoViewModel {
    
    let todo: TodoModel
    
    var id: NSManagedObjectID {
        return todo.objectID
    }
    
    var title: String {
        return todo.title ?? ""
    }
    
}
