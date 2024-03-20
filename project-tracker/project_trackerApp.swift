//
//  project_trackerApp.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/20/24.
//

import SwiftUI
import SwiftData

@main
struct project_trackerApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
