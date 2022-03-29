//
//  Mar28_SwiftUIOnlyApp.swift
//  Mar28_SwiftUIOnly
//
//  Created by Consultant on 3/28/22.
//

import SwiftUI

@main
struct Mar28_SwiftUIOnlyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
