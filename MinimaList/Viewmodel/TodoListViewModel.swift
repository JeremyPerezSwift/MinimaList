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
    @Published var progressValue: Float = 0.0
    
    var progressDisplayValue: String {
        return progressValue > 0.0 ? "\(Int(progressValue * 100)) %" : "0%"
    }

    func getTodosByList(vm: ListViewModel) {
        DispatchQueue.main.async {
            self.todos = TodoModel.getTodoByListId(listId: vm.id).map(TodoViewModel.init)
            
            var completed = 0
            for todo in self.todos {
                if todo.completed == true {
                    completed += 1
                }
            }
            
            if self.todos.count > 0 {
                self.progressValue = Float(completed) / Float(self.todos.count)
            } else {
                self.progressValue = 0.0
            }
            
        }
    }
    
    func getTodosByListWithCheck(vm: ListViewModel) {
        DispatchQueue.main.async {
            self.todos = TodoModel.getTodoByListId(listId: vm.id).map(TodoViewModel.init)
            
            var completed = 0
            for todo in self.todos {
                if todo.completed == true {
                    completed += 1
                }
            }
            
            if self.todos.count > 0 {
                self.progressValue = Float(completed) / Float(self.todos.count)
            } else {
                self.progressValue = 0.0
            }
            
            self.updateProgressBarList(vm: vm)
            
        }
    }
    
    func deleteTodo(todo_P: TodoViewModel) {
        let todo: TodoModel? = TodoModel.byId(id: todo_P.id)
        if let todo = todo {
            todo.delete()
        }
    }
    
    func toggleComplete(todo: TodoViewModel, isChecked: Bool) {
        
        let todo_M: TodoModel? = TodoModel.byId(id: todo.id)
        if let todo_M = todo_M {
            todo_M.completed = isChecked
            print("DEBUG: \(isChecked)")
            todo_M.save()
        }
        
    }
    
    func toggleAllTodoComplete(todos: [TodoViewModel]) {
        
        for todo in todos {
            let todo_M: TodoModel? = TodoModel.byId(id: todo.id)
            if let todo_M = todo_M {
                todo_M.completed = false
                todo_M.save()
            }
        }

    }
    
    func updateProgressBarList(vm: ListViewModel) {
        let list: ListModel? = ListModel.byId(id: vm.id)
        if let list = list {
            list.progressValue = self.progressValue
            
            list.save()
        }
    }
    
    func updateCompletedList(vm: ListViewModel) {
        let list: ListModel? = ListModel.byId(id: vm.id)
        if let list = list {
            list.completed = true
            list.progressValue = 0.0
            list.save()
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
    
    var completed: Bool {
        return todo.completed
    }
    
}
