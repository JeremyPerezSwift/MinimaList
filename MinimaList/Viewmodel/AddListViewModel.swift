//
//  AddListViewModel.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation

class AddListViewModel: ObservableObject {
    
    var title: String = ""
    
    func save() {
        let list = ListModel(context: ListModel.viewContext)
        
        list.title = title
        list.progressValue = 0.0
        list.publishedAt = Date()

        list.save()
    }
    
}
