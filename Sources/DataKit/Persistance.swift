//
//  Persistence.swift
//  Vide
//
//  Created by Valentin Mont School on 09/04/2022.
//

import CoreData

@available(iOS 15.0, *)
open class Persistence {

    // MARK: - Properties
    // MARK: Open
    open var container: NSPersistentContainer

    open var dataManager: DataManager

    // MARK: - Lifecycle
    public init(xcdatamodel: String, inMemory: Bool = false) {
        container = NSPersistentContainer(name: xcdatamodel)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        dataManager = DataManager(context: container.viewContext, container: container)
    }
}
