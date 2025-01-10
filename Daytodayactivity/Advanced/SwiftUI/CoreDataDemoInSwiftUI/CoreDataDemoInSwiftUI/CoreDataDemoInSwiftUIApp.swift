//
//  CoreDataDemoInSwiftUIApp.swift
//  CoreDataDemoInSwiftUI
//
//  Created by FCI on 09/12/24.
//

import SwiftUI

@main
struct CoreDataDemoInSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
