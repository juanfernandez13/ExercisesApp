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
    var groups: [String]
    var exercises: [Exercise]
    
    init(name: String, groups: [String], exercises: [Exercise]) {
        self.name = name
        self.groups = groups
        self.exercises = exercises
    }
}

@Model
class Exercise {
    var name: String
    var sets: Int
    var repetitions: Int
    
    init(name: String, sets: Int, repetitions: Int) {
        self.name = name
        self.sets = sets
        self.repetitions = repetitions
    }
    
}
