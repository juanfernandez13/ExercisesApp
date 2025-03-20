//
//  ExercisesAppApp.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData

@main
struct ExercisesAppApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
        }.modelContainer(for: [TrainingModel.self])
    }
}
