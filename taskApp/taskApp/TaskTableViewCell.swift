//
//  TaskTableViewCell.swift
//  taskApp
//
//  Created by Danielle Nozaki Ogawa on 11/05/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTask(_ task: Task){
        taskNameLabel.text = task.taskName
        taskDescriptionLabel.text = task.taskDescription
    }

}
