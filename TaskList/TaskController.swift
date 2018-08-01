//
//  TaskController.swift
//  TaskList
//
//  Created by Seth Danner on 8/1/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    var tasks: [Task] = []
    
    // MARK: CRUD Functions
    func add(taskWith name: String, notes: String?, due: Date?) {
        
        let _ = Task(name: name, note: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, note: String?, due: Date?) {
        
        task.name = name
        task.note = note
        task.due = due
        saveToPersistentStore()
    }
    
    func delete(task: Task) {
        
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
    }
    
    
    // Core Data
    func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("Error saving data to persistent store: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        
    }
    
    func toggleIsCompleted(task: Task) {
        
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
}
