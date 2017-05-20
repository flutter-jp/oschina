//
//  TodoContentCellTableViewCell.swift
//  TodoList
//
//  Created by xiaomo on 17/5/20.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit

class TodoContentCellTableViewCell: UITableViewCell {
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var completedFlag: UIButton!
    @IBOutlet weak var dueDate: UILabel!
    
    var delege : TodoContentCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func flipTodo(_ sender: UIButton) {
        self.completedFlag.isSelected = !self.completedFlag.isSelected
        var textAttributes = [String: Any]()
        if sender.isSelected {
            textAttributes = [NSStrikethroughStyleAttributeName : NSUnderlineStyle.styleSingle.rawValue]
        }
        self.item.attributedText = NSMutableAttributedString(string: self.item.text!, attributes: textAttributes)
        self.delege?.updateTodoState(cell: self, completed: self.completedFlag.isSelected)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

protocol TodoContentCellProtocol {
    // 这是协议中的方法
    func updateTodoState(cell: TodoContentCellTableViewCell, completed: Bool)
}
