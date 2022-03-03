//
//  Todo.swift
//  ToDoList
//
//  Created by Aleksandra Kowalczyk on 13/05/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//
import RealmSwift

class Todo: Object {
    @objc dynamic var title: String?
    @objc dynamic var tag: String?
    @objc dynamic var priority: Int = 0
}
