//
//  AddTodoViewModel.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation

class AddTodoViewModel: ObservableObject {
    var title: String = ""
   
    func addTodoForList(vm: ListViewModel) {
        let list: ListModel? = ListModel.byId(id: vm.id)
        
        if let list = list {
            let review = TodoModel(context: TodoModel.viewContext)
            review.title = title
            review.listmodel = list
            
            review.save()
        }
    }
    
}
