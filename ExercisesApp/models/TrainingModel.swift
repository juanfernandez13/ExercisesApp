//
//  TrainingModel.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftData

@Model
class TrainingModel {
    var name: String
    var exercises: [String]
    
    init(name: String, exercises: [String]) {
        self.name = name
        self.exercises = exercises
    }
}
