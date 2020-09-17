//
//  TaskController.swift
//  Task
//
//  Created by LAURA JELENICH on 9/16/20.
//  Copyright © 2020 LAURA JELENICH. All rights reserved.
//

import Foundation

class TaskController {
    
    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    var mockTasks: [Task] = {
        let task1 = Task(name: "Task One", notes: "notes", due: Date())
        let task2 = Task(name: "Task Two", notes: "Some Notes", due: Date())
        let task3 = Task(name: "Task Three", notes: "More Notes", due: Date())
        return [task1, task2, task3]
    }()
    
    init() {
        tasks = fetchTasks()
    }
    
    func add(name: String, notes: String, due: Date) {
        _ = Task(name: name, notes: notes, due: due)
    }
    
    func update(task: Task, name: String, notes: String, due: Date) {
        task.name = name
        task.notes = notes
        task.due = due
    }
    
    func remove(task: Task) {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print("Error saving \(error.localizedDescription)")
        }
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
    
}
