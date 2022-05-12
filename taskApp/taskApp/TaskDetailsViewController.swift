//
//  TaskDetailsViewController.swift
//  taskApp
//
//  Created by Danielle Nozaki Ogawa on 11/05/22.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureDetails()
        if let taskName = task?.taskName {
            taskNameLabel.text = taskName
        }
        if let taskDescription = task?.taskDescription {
            taskDescriptionLabel.text = taskDescription
        }

        
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
//    func configureDetails(){
//        guard let task = task else { return }
//        taskNameLabel.text = task.taskName
//        taskDescriptionLabel.text = task.taskDescription
//    }
}
