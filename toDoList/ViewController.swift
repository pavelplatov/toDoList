//
//  ViewController.swift
//  toDoList
//
//  Created by Павел Платов on 17.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TodoCellDelegate {
 
    let todosKey = "todos"
    var todos: [Todo] = [Todo(isComplited: false, name: "Test")]
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadTodos()
        
     
    }
    
    @IBAction func addTodoPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Create todo", message: "", preferredStyle: .alert)
        alert.addTextField()
        let saveButton = UIAlertAction(title: "Save", style: .default) { _ in
            if let textName = alert.textFields?.first?.text {
                self.todos.append(Todo(isComplited: false, name: textName))
                self.tableView.reloadData()
                self.saveTodos()
               
            }
        }
        alert.addAction(saveButton)
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
    // MARK: - Table View Methods
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
        let todoCell = todos[indexPath.row]
      cell.delegate = self
      cell.updateCell(with: todoCell)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            saveTodos()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func cellPressed(cell: TodoTableViewCell) {
        guard let index = tableView.indexPath(for: cell)
        else { return }
        let todo = todos[index.row]
        todo.isCompleted.toggle()
        tableView.reloadData()
        saveTodos()
        
    }
}

