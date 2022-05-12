//
//  ViewController.swift
//  taskApp
//
//  Created by Danielle Nozaki Ogawa on 11/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskList: UITableView!
    
    var listOfTask: [Task] = []
    var task: Task?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskList.dataSource = self
        taskList.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let registerTaskController = segue.destination as? ResgisterTaskViewController {
            registerTaskController.delegate = self
        }
        
        if let detailsTaskVC = segue.destination as? TaskDetailsViewController {
            if let task = sender as? Task? {
                detailsTaskVC.task = task
            }
        }
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        performSegue(withIdentifier: "addTaskIdentifier", sender: nil)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let row = listOfTask[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell {
            
            cell.configureTask(listOfTask[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        task = listOfTask[indexPath.row]
        performSegue(withIdentifier: "taskDetails", sender: task)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        listOfTask.remove(at: row)
        taskList.reloadData()
    }
}

extension ViewController: ResgisterTaskViewControllerDelegate {
    func add(_ task: Task) {
        listOfTask.append(task)
        taskList.reloadData()
        dismiss(animated: true)
    }
    
    
}
