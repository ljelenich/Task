//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by LAURA JELENICH on 9/16/20.
//  Copyright © 2020 LAURA JELENICH. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task?
    var dueDateValue: Date?
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("saved")
        guard let name = nameTextField.text, !name.isEmpty, let note = notesTextView.text, !note.isEmpty, let date = dueDateValue else {return}
        if let task = task {
            print("update task")
            TaskController.shared.update(task: task, name: name, notes: note, due: date)
        } else {
            print("add task")
            TaskController.shared.add(name: name, notes: note, due: date)
        }
        nameTextField.text = ""
        notesTextView.text = ""
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        nameTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
    }
    
    //MARK: - Helper Functions
    func updateViews() {
        guard let task = task else {return}
        nameTextField.text = task.name
        notesTextView.text = task.notes
        dueDateTextField.text = task.due?.stringValue()
        
    }
}
