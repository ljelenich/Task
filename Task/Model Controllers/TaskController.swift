//
//  TaskController.swift
//  Task
//
//  Created by LAURA JELENICH on 9/16/20.
//  Copyright © 2020 LAURA JELENICH. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    var fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            
        }
//        tasks = fetchTasks()
    }
    
    func add(name: String, notes: String, due: Date) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String, due: Date) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
//    func fetchTasks() -> [Task] {
//        return mockTasks
//    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
}
