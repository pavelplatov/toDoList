//
//  Todo.swift
//  toDoList
//
//  Created by Павел Платов on 17.01.2024.
//

import Foundation

class Todo: Codable {
    var name: String
    var isCompleted: Bool
    var id: UUID
    
    init(isComplited: Bool, name: String, id: UUID = UUID()) {
        self.isCompleted = isComplited
        self.id = id
        self.name = name
    }
}
