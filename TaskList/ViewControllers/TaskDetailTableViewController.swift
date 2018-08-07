//
//  TaskDetailTableViewController.swift
//  TaskList
//
//  Created by Seth Danner on 8/1/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    // Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDate: Date?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDateTextField.inputView = dueDatePicker
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let name = nameTextField.text else { return }
        let due = dueDate
        let notes = notesTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, note: notes, due: due)
        } else {
            TaskController.shared.add(taskWith: name, notes: notes, due: due)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDate = sender.date
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        
        self.nameTextField.resignFirstResponder()
        self.dueDatePicker.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        
        guard let task = task, isViewLoaded else { return }
        nameTextField.text = task.name
        dueDateTextField.text = task.due?.stringValue()
        notesTextView.text = task.note
    }
}
