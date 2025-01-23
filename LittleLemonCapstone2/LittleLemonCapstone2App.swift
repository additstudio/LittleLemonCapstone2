//
//  LittleLemonCapstone2App.swift
//  LittleLemonCapstone2
//
//  Created by Cindy Wai Yan Cheung on 23/1/2025.
//

import SwiftUI

@main
struct LittleLemonCapstone2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
