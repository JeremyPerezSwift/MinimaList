//
//  TodoModel+Extension.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation
import CoreData

extension TodoModel: BaseModel {
    static func getTodoByListId(listId: NSManagedObjectID) -> [TodoModel] {
        let request: NSFetchRequest<TodoModel> = TodoModel.fetchRequest()
        request.predicate = NSPredicate(format: "listmodel = %@", listId)
        
        do {
            return try CoreDataProvider.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
