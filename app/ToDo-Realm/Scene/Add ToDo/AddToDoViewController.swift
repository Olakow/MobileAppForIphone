//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Aleksandra Kowalczyk on 11/05/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet var priorityButtons: [UIButton]!
   
    let notANumberMessage = UIAlertController(title: "Error", message: "You can type only numbers. Use dot(.) as a separator", preferredStyle: .alert)
    
    let nothingInMessage = UIAlertController(title: "Error", message: "Nothing in a field. You need to type something", preferredStyle: .alert)

    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
     })
    
    var selectedPriority: Priority?
    var todoList: RealmTodoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.todoList = try RealmTodoList.init()
        } catch let e {
            print("", e)
        }

        for button in self.priorityButtons {
            guard let priority = Priority.init(rawValue: button.tag) else { return }
            button.backgroundColor = priority.color()
            button.layer.cornerRadius = button.frame.width/2
            button.alpha = 0.5
        }
        
    }

    @IBAction func addButton_clicked(_ sender: UIBarButtonItem) {
        
        guard
            let title = self.titleTextView.text,
            !title.isEmpty
        else {
            nothingInMessage.addAction(ok)
            self.present(nothingInMessage, animated: true, completion: nil)
            return
        }
        
        guard
            var tag = (self.tagTextField.text),
            !tag.isEmpty
        else {
           nothingInMessage.addAction(ok)
            self.present( nothingInMessage, animated: true, completion: nil)
            return
        }
        
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        
        if (Set(tag).isSubset(of: nums)){
        }
        else{
            notANumberMessage.addAction(ok)
            self.present( notANumberMessage, animated: true, completion: nil)
            return
        }
        
        
        guard let priority = self.selectedPriority else {
           nothingInMessage.addAction(ok)
            self.present(nothingInMessage, animated: true, completion: nil)
            return
        }
        
        let todo = Todo.init()
        todo.title = title
         todo.tag = tag
        todo.priority = priority.rawValue
        
        do {
            try self.todoList?.add(todo: todo)
            
            self.navigationController?.popViewController(animated: true)
        } catch let e {
            print("find a exception", e)
        }
        
    }
    
   
    @IBAction func priorityButton_clicked(_ sender: UIButton) {
        let selectedButton = sender.tag
        
        guard
            let priority = Priority.init(rawValue: selectedButton)
        else {
            return
        }
        
        self.selectedPriority = priority
        
        for button in self.priorityButtons {
            if (button == sender) {
                button.alpha = 1
            } else {
                button.alpha = 0.5
            }
            
        }

    }
}

