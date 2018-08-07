//
//  TaskTableViewCell.swift
//  TaskList
//
//  Created by Seth Danner on 8/1/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

protocol TaskTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: TaskTableViewCell)
}

@IBDesignable

class TaskTableViewCell: UITableViewCell {
    
    var delegate: TaskTableViewCellDelegate?
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        isCompleteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
}

extension TaskTableViewCell {
    func update(withTask task: Task) {
        
        taskNameLabel.text = task.name
        updateButton(task.isComplete)
    }
}
