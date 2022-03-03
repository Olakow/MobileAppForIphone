//
//  EditToDoViewController.swift
//  Budget-planner
//
//  Created by Aleksandra Kowalczyk on 05/06/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//

import UIKit

class EditToDoViewController: UIViewController{
    

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var thirdName: UITextField!
    @IBOutlet weak var fourthName: UITextField!
    @IBOutlet weak var fifthName: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func editButton_cliked(_ sender: UIBarButtonItem) {
       
      
        let name1 = self.firstName.text
        ToDoViewController.personVariable[0] = name1 ?? "-"
        let name2 = self.secondName.text
        ToDoViewController.personVariable[1] = name2 ?? "-"
        let name3 = self.thirdName.text
        ToDoViewController.personVariable[2] = name3 ?? "-"
        let name4 = self.fourthName.text
        ToDoViewController.personVariable[3] = name4 ?? "-"
        let name5 = self.fifthName.text
        ToDoViewController.personVariable[4] = name5 ?? "-"
        
        self.navigationController?.popViewController(animated: true)
    }

    
}
