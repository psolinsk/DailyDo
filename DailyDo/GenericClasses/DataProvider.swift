//
//  DataProvider.swift
//  DailyDo
//
//  Created by Patryk Soliński on 19/09/2022.
//

import Foundation
import CoreData

protocol DataProviderDelegate: AnyObject {
    func didInsertItem(at indexPath: IndexPath)
    func didDeleteItem(at indexPath: IndexPath)
}

final class DataProvider<Model: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    
    weak var delegate: DataProviderDelegate?
    
    private var managedObjectContex: NSManagedObjectContext
    private var sortDescriptors: [NSSortDescriptor]
    private var predicate: NSPredicate?
    
    private lazy var request: NSFetchRequest<Model> = {
        let request = NSFetchRequest<Model>(entityName: String(describing: Model.self))
        request.sortDescriptors = sortDescriptors
        if let predicate = predicate {
            request.predicate = predicate
        }
        
        return request
    }()
    
    private lazy var fetchResultController: NSFetchedResultsController<Model> = {
       let fetchedResults = NSFetchedResultsController<Model>(fetchRequest: request, managedObjectContext: managedObjectContex, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResults.delegate = self
        return fetchedResults
    }()
    
    init(managedObjectContex: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil) {
        self.managedObjectContex = managedObjectContex
        self.sortDescriptors = sortDescriptors
        self.predicate = predicate
        
        super.init()
        
        performFetch()
    }
    
    func performFetch() {
        do {
            try fetchResultController.performFetch()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func objectAtIndex(indexPath: IndexPath) -> Model {
        return fetchResultController.object(at: indexPath)
    }
    
    func numberOfSections() -> Int {
        return fetchResultController.sections?.count ?? 1
    }
    
    func rowsInSection(section: Int) -> Int {
        return fetchResultController.sections?[section].numberOfObjects ?? 0
    }
    
    func deleteItem(at indexPath: IndexPath) {
        let item = objectAtIndex(indexPath: indexPath)
        managedObjectContex.delete(item)
        do {
            try managedObjectContex.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            if let idxPath = newIndexPath {
                delegate?.didDeleteItem(at: idxPath)
            }
        } else if type == .delete {
            if let idxPath = indexPath {
                delegate?.didDeleteItem(at: idxPath)
            }
        }
    }
}
