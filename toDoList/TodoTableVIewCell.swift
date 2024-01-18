import Foundation
import UIKit

protocol TodoCellDelegate: AnyObject {
    func cellPressed(cell: TodoTableViewCell)
}

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet var toDoButton: UIButton!
    
    weak var delegate: TodoCellDelegate?
    
    func updateCell(with todo: Todo) {
        toDoLabel.text = todo.name
        toDoButton.setImage(UIImage(systemName: todo.isCompleted ? "checkmark.square": "square"), for: .normal)
    }
    
    @IBAction func toDoButtonPressed(_ sender: Any) {
        delegate?.cellPressed(cell: self)
        
    }
    
    
}
