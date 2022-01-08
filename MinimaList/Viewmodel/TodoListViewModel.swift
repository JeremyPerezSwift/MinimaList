//
//  TodoListViewModel.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation
import CoreData

enum FilterCheck {
    case date
    case title
    case completed
}

class TodoListViewModel: ObservableObject {
    
    @Published var todos = [TodoViewModel]()
    @Published var progressValue: Float = 0.0
    
    var filterCheck: FilterCheck = .date
    
    var progressDisplayValue: String {
        return progressValue > 0.0 ? "\(Int(progressValue * 100)) %" : "0%"
    }

    func getTodosByList(vm: ListViewModel) {
        DispatchQueue.main.async {
            self.todos = TodoModel.getTodoByListId(listId: vm.id).map(TodoViewModel.init)
            self.filterTodoByDate(todos: self.todos)
            
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
            
            switch self.filterCheck {
            case .date:
                self.filterTodoByDate(todos: self.todos)
            case .title:
                self.filterTodoByTitle(todos: self.todos)
            case .completed:
                self.filterTodoByCompleted(todos: self.todos)
            }
            
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
    
    func filterTodoByDate(todos: [TodoViewModel]) {
        let todosFilter = todos.sorted { $0.publishedAt > $1.publishedAt }
        self.todos = todosFilter
    }
    
    func filterTodoByTitle(todos: [TodoViewModel]) {
        let todosFilter = todos.sorted { $0.title > $1.title }
        self.todos = todosFilter
    }
    
    func filterTodoByCompleted(todos: [TodoViewModel]) {
        let todosFilter = todos.sorted { !$0.completed && $1.completed }
        self.todos = todosFilter
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
    
    var publishedAt: Date {
        return todo.publishedAt ?? Date()
    }
    
}
