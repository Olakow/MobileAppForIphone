//
//  ViewController.swift
//  ToDoList
//
//  Created by Aleksandra Kowalczyk on 22/05/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//

import UIKit
import Charts

class ToDoViewController: UIViewController {
    
    @IBOutlet var BorrowedLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var pieChartView2: PieChartView!
    @IBOutlet var LentLabel: UILabel!
    @IBOutlet var SumLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var trip_organisation_segmented_control : UISegmentedControl!


    @IBOutlet var First: UILabel!
    @IBOutlet var Second: UILabel!
    @IBOutlet var Third: UILabel!
    @IBOutlet var Fourth: UILabel!
    @IBOutlet var Fifth: UILabel!
    @IBOutlet var Others: UILabel!
    
    @IBOutlet var FirstPerson: UILabel!
    @IBOutlet var SecondPerson: UILabel!
    @IBOutlet var ThirdPerson: UILabel!
    @IBOutlet var FourthPerson: UILabel!
    @IBOutlet var FifthPerson: UILabel!
    
    @IBOutlet var travel: UILabel!
    @IBOutlet var home: UILabel!
    @IBOutlet var car: UILabel!
    @IBOutlet var outgoing: UILabel!
    @IBOutlet var shopping: UILabel!
    @IBOutlet var study: UILabel!
    
    

    
    var sum_tab = [0.0,0.0,0.0,0.0,0.0]
    var ewallet_tab = ["borrowed", "lent"]
    var ewallet_goals = [0.0, 0.0]
    var costs_tab = ["travel","home","car","outgoing","shopping","study"]
    var costs_goals = [0.0,0.0,0.0,0.0,0.0,0.0]
    public static var personVariable = ["First","Second","Third","Fourth","Fifth"]
 
    
    let tripOrganisationMessage = UIAlertController(title: "Question", message: "How mamy people take part in settlements?", preferredStyle: .alert)
    let rulesMessage = UIAlertController(title: "Info", message: "This rule is really easy! Every person, which have negative number must give this amount of money to one 'jar' (or send a transfer to one bank account). Then, every person with positive number take this amount from this 'jar' And that's it!"  ,preferredStyle: .alert)
    let notAIntegerNumberMessage = UIAlertController(title: "Alert", message: "You can type only integer number.", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style:  .default) { (action) -> Void in}
    let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in}


    
    var todoList: RealmTodoList?
    var todoListObjects: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let id = self.restorationIdentifier

        if(  id == "1"  ||  id == "2"  || id == "3"  ){
    
        do {
            self.todoList = try RealmTodoList.init()
            self.tableView.dataSource = self
        } catch let e {
        }
        
    }
        if(  id == "4" || id == "5" ||  id == "6" ||  id == "7" ){
        do {
            self.todoList = try RealmTodoList.init()
        } catch let e {
        }
        
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let id = self.restorationIdentifier
        
        var priority = Priority.init(rawValue: 0)
              
              if id == "1"{
                var i = 0
                while(i<5){
                trip_organisation_segmented_control.setTitle(ToDoViewController.personVariable[i], forSegmentAt: i)
                    i += 1
                }
                  priority = Priority.init(rawValue: 0)
                self.todoListObjects = (self.todoList?.getAll(priority: priority))!
                self.tableView.reloadData()
              }
         
              if id == "2"{

                
                  priority = Priority.init(rawValue: 5)
                self.todoListObjects = (self.todoList?.getAll(priority: priority))!
                self.tableView.reloadData()
            
              }
         
              if id == "3"{
                  priority = Priority.init(rawValue: 7)
                self.todoListObjects = (self.todoList?.getAll(priority: priority))!
                self.tableView.reloadData()
                
              }
        
        if id == "5"{
            

            let ok = UIAlertAction(title: "OK", style: .default, handler: { [self] (action) -> Void in
                
            
                var people = (tripOrganisationMessage.textFields?.first?.text) as!String
                
                let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                
                if (Set(people).isSubset(of: nums)){
                }
                else{
                    notAIntegerNumberMessage.addAction(cancel)
                    self.present( notAIntegerNumberMessage, animated: true, completion: nil)
                    return
                }
                var all_sum = 0.0
                var i = 0
                while(i < 5){
                    var sum = 0.0
                    let priority = Priority.init(rawValue: i)
                    self.todoListObjects = (self.todoList?.getAll(priority: priority))!
                    
                    let count = todoListObjects.count
                    var todo = self.todoListObjects
                
                    var j = 0
                    while(j < count){
                      let td = todo.first
                        sum += Double((td?.tag)!)!
                        todo.removeFirst()
                        j+=1
                    }
     
                    sum_tab[i] = sum
                    i += 1
                    all_sum += sum
                    
                }
    
                let n_people = Double(people)!
                let amount = all_sum / n_people
                
                
                self.FirstPerson.text = String(ToDoViewController.personVariable[0])
                self.SecondPerson.text = String(ToDoViewController.personVariable[1])
                self.ThirdPerson.text = String(ToDoViewController.personVariable[2])
                self.FourthPerson.text = String(ToDoViewController.personVariable[3])
                self.FifthPerson.text = String(ToDoViewController.personVariable[4])
                
             
                self.First.text =  (String(format: "%.2f",sum_tab[0] - amount))
                self.Second.text =  (String(format: "%.2f",sum_tab[1] - amount))
                self.Third.text =  (String(format: "%.2f",sum_tab[2] - amount))
                self.Fourth.text = (String(format: "%.2f",sum_tab[3] - amount))
                self.Fifth.text = (String(format: "%.2f",sum_tab[4] - amount))
                
                if(n_people > 5){
                self.Others.text = (String(format: "%.2f",0 - amount))
                } else{
                    self.Others.text = String(0)
                }
    
            })
            
           tripOrganisationMessage.addTextField(configurationHandler: { textField in
                        textField.placeholder = "Type in number of people"
                    })
            
 
           tripOrganisationMessage.addAction(ok)
            self.present(tripOrganisationMessage, animated: true, completion: nil)
        }
    
        if id == "6"{
        
            var i = 0
            while(i < 2){
                var sum = 0.0
                let priority = Priority.init(rawValue: (i+5))
                self.todoListObjects = (self.todoList?.getAll(priority: priority))!
                
                let count = todoListObjects.count
                var todo = self.todoListObjects
                
            
                var j = 0
                while(j < count){
                  let td = todo.first
                    sum += Double((td?.tag)!)!
                    todo.removeFirst()
                    j+=1
                }
        
                ewallet_goals[i] = sum
                i += 1
            
            }
            
            let sum = ewallet_goals[1] - ewallet_goals[0]
            
    
            self.BorrowedLabel.text = (String(format: "%.2f",ewallet_goals[1]))
            self.LentLabel.text = (String(format: "%.2f",ewallet_goals[0]))
            self.SumLabel.text = (String(format: "%.2f",sum))
           
            pieChartView.data = PieChartClass.customizeChart(dataPoints: ewallet_tab, values: ewallet_goals.map{ Double($0) })
     
            
        }
        
        if id == "7"{
            
            var all_sum = 0.0
            var i = 0
            while(i < 6){
                var sum = 0.0
                print(i)
                let priority = Priority.init(rawValue: (i+7))
                self.todoListObjects = (self.todoList?.getAll(priority: priority))!
                
                let count = todoListObjects.count
                var todo = self.todoListObjects
                
                var j = 0
                while(j < count){
                  let td = todo.first
                    sum += Double((td?.tag)!)!
                    todo.removeFirst()
                    j+=1
                }
        
                costs_goals[i] = sum
                i += 1
                all_sum += sum
            
            }
        
            self.travel.text = (String(format: "%.2f", costs_goals[0] / all_sum * 100 )) + "% \n" + (String(format: "%.2f", costs_goals[0] ))
            self.home.text = (String(format: "%.2f", costs_goals[1] / all_sum * 100 )) + "% \n" + (String(format: "%.2f", costs_goals[1] ))
            self.car.text = (String(format: "%.2f", costs_goals[2] / all_sum * 100 )) + "% \n" + (String(format: "%.2f", costs_goals[2] ))
            self.outgoing.text = (String(format: "%.2f", costs_goals[3] / all_sum * 100 )) + "% \n" + (String(format: "%.2f", costs_goals[3] ))
            self.shopping.text = (String(format: "%.2f", costs_goals[4] / all_sum * 100 )) + "% \n" + (String(format: "%.2f", costs_goals[4] ))
            self.study.text = (String(format: "%.2f", costs_goals[5] / all_sum * 100 )) + "% \n" + (String(format: "%.2f", costs_goals[5] ))
           
        
            pieChartView2.data = PieChartClass.customizeChart(dataPoints: costs_tab, values: costs_goals.map{ Double($0) })
            
        }
        
    }
    
    
    @IBAction func showRules(_ sender: UIButton) {
        rulesMessage.addAction(ok)
        self.present(rulesMessage, animated: true, completion: nil)

       }
    
    @IBAction func editButton_clicked(_ sender: UIBarButtonItem) {
       
        self.performSegue(withIdentifier: "segueToEditViewController", sender: nil)
    }
    
    
    @IBAction func addButton_clicked(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "segueToAddViewController", sender: nil)
    }
    
    
    @IBAction func editButton_cliked(_ sender: UIBarButtonItem) {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func priorityFilter_selected(_ sender: UISegmentedControl) {
        
               var index = 0
               let id = self.restorationIdentifier
             
               if id == "1"{
                   index = sender.selectedSegmentIndex
               }
          
               if id == "2"{
                   index = sender.selectedSegmentIndex + 5
               }
          
               if id == "3"{
                   index = sender.selectedSegmentIndex + 7
               }
                       
               
               let priority = Priority.init(rawValue: index)
               
        
        
        self.todoListObjects = (self.todoList?.getAll(priority: priority))!
        self.tableView.reloadData()
           
           }
}

extension ToDoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoListObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = self.todoListObjects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoTableViewCell
        cell.toDoTitleLabel.text = todo.title
        cell.toDoTagLabel.text = todo.tag
        cell.toDoPriorityView.backgroundColor = Priority.init(rawValue: todo.priority)?.color()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath ) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            

            tableView.beginUpdates()
            let c = todoListObjects.count
            print (c)

            tableView.deleteRows(at: [indexPath] , with: .fade)
            
            let todo = todoListObjects.remove(at: indexPath.row)
            
            
            do {
                try self.todoList?.delete(todo: todo)
            } catch let e {
                print("find an exception", e)
            }
            
            
            let e = todoListObjects.count
            print (e)
            
            
            self.tableView.reloadData()
            viewDidLoad()
            tableView.endUpdates()
        }
    }
}
