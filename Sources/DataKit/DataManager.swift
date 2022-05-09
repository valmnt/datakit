//
//  DataManager.swift
//  
//
//  Created by Valentin Mont School on 10/05/2022.
//

import Foundation
import CoreData

@available(iOS 15.0, *)
open class DataManager {

    open var context: NSManagedObjectContext

    private var container: NSPersistentContainer

    init(context: NSManagedObjectContext, container: NSPersistentContainer) {
        self.context = context
        self.container = container
    }

    open func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }

    open func eraseAll() {
        let entities = container.managedObjectModel.entities
        for entity in entities {
            delete(entityName: entity.name!)
        }
    }

    private func delete(entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try container.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
}
