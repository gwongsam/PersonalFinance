//
//  PersonalFinanceAppApp.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import SwiftUI

@main
struct PersonalFinanceAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
