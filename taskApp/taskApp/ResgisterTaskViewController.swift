//
//  ResgiterTaskViewController.swift
//  taskApp
//
//  Created by Danielle Nozaki Ogawa on 11/05/22.
//

import UIKit

protocol ResgisterTaskViewControllerDelegate {
    func add(_ task: Task)
}

class ResgisterTaskViewController: UIViewController {

    var delegate: ResgisterTaskViewControllerDelegate?
    
    var task: Task?
    
    var listOfTask: [Task] = []
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func taskRegisterButton(_ sender: Any) {
        guard let nameTask = taskNameTextField.text, taskNameTextField.hasText else { return }
        guard let descriptionTask = taskDescriptionTextField.text, taskDescriptionTextField.hasText else { return }
        
        let newTask = Task(taskName: nameTask, taskDescription: descriptionTask)
        delegate?.add(newTask)
        
    }


}
