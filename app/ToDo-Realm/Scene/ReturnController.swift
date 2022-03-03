//
//  ReturnController.swift
//  ToDoList
//
//  Created by Aleksandra Kowalczyk on 13/05/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//
import UIKit

class ReturnController: UIViewController {

 
    @IBAction func ReturnTouched(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
