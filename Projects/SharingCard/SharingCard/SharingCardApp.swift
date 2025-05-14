//
//  SharingCardApp.swift
//  SharingCard
//
//  Created by bear on 4/17/25.
//

import SwiftUI
import SwiftData

@main
struct SharingCardApp: App {
    
    let modelContainer: ModelContainer = {
        let schema = Schema([SavedMemo.self])
        let modelConfiguration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError(error.localizedDescription)
        }
    }()
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(modelContainer)
        }
    }
}
