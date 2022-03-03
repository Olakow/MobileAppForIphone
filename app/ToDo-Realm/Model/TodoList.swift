//
//  TodoList.swift
//  ToDoList
//
//  Created by Aleksandra Kowalczyk on 13/05/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//


import RealmSwift

struct RealmTodoList {

    init() throws {
        self.realm = try Realm.init()
    }
    
    fileprivate var realm: Realm
    fileprivate var elements: [Todo] = []
    
 
    func add(todo: Todo) throws {
        try self.realm.write {
            self.realm.add(todo)
        }
    }
    
       func delete(todo: Todo) throws {
           try self.realm.write {
               self.realm.delete(todo)
           }
       }
 
    
    func getAll(priority: Priority? = nil) -> [Todo] {
        
        let results: Results<Todo>
        
        if let selectedPriority = priority {
            results = self.realm.objects(Todo.self).filter("priority == \(selectedPriority.rawValue)")
        } else {
            results = self.realm.objects(Todo.self)
        }
        
        guard !results.isEmpty else {
            return []
        }
        
        return Array.init(results)
    }
    
    
}
