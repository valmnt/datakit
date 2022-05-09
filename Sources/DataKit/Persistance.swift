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
    // MARK: Static
    public static let shared = Persistence()

    // MARK: Public
    open var mainContext: NSManagedObjectContext
    
    open var container: NSPersistentContainer

    // MARK: - Lifecycle
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        mainContext = container.viewContext
    }
}
