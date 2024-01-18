//
//  Extensions.swift
//  toDoList
//
//  Created by Павел Платов on 18.01.2024.
//

import Foundation

extension ViewController {
    func saveTodos() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(todos) {
            UserDefaults.standard.set(encoded, forKey: todosKey)
        }
    }

    func loadTodos() {
        if let savedTodos = UserDefaults.standard.object(forKey: todosKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedTodos = try? decoder.decode([Todo].self, from: savedTodos) {
                todos = loadedTodos
                tableView.reloadData()
            }
        }
    }
}
