//
//  CoreDataProvider.swift
//  MinimaList
//
//  Created by Jérémy Perez on 06/01/2022.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataProvider()
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MinimaList")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("DEBUG: Failed to initialize CoreData \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}
