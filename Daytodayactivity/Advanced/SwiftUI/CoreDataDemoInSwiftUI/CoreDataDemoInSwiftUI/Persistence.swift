//
//  Persistence.swift
//  CoreDataDemoInSwiftUI
//
//  Created by FCI on 09/12/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
        
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreDataDemoInSwiftUI")

        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
