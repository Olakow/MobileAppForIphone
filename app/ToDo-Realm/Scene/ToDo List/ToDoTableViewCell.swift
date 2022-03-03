//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Aleksandra Kowalczyk on 13/05/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//

import UIKit
import Charts


class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet var toDoView: UIView!
    @IBOutlet var toDoTitleLabel: UILabel!
    @IBOutlet var toDoTagLabel: UILabel!
    @IBOutlet var toDoPriorityView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.toDoView.layer.cornerRadius = 6
        self.toDoPriorityView.layer.cornerRadius = self.toDoPriorityView.frame.width/2
    }
    
    
}
