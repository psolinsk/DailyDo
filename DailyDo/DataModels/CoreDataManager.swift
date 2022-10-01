//
//  CoreDataManager.swift
//  DailyDo
//
//  Created by Patryk Soliński on 19/09/2022.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DailyDo")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unreslove error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    private init() {
        managedObjectContext = self.persistentContainer.viewContext
    }
    
    private func saveContex() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let err {
                let error = err as NSError
                fatalError("Unreslove error \(error), \(error.userInfo)")
            }
        }
    }
}

extension CoreDataManager {
    func saveFolder(name: String) {
        let folder = Folder(context: managedObjectContext)
        folder.title = name
        saveContex()
    }
    
    func saveToDo(folder: String, todoItem: String) {
        let todo = Todo(context: managedObjectContext)
        todo.folder = folder
        todo.title = todoItem
        saveContex()
    }
}
