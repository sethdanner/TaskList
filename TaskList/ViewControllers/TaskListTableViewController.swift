//
//  TaskListTableViewController.swift
//  TaskList
//
//  Created by Seth Danner on 8/1/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)

        // Configure the cell...

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let taskDetailVC = segue.destination as? TaskDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow
                else { return }
            
            let task = TaskController.shared.tasks[indexPath.row]
            taskDetailVC.task = task
            taskDetailVC.dueDate = task.due
        }
    }
}
