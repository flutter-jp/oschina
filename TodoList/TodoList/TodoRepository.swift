//
//  TodoRepository.swift
//  TodoList
//
//  Created by xiaomo on 17/5/20.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import Foundation

class TodoRepository {
    
    func findAllItems() -> [TodoList]{
        var todolists:[TodoList] = [TodoList(content: "工作"), TodoList(content: "生活")]
        todolists[0].todos = [
            Todo(content: "抢银行", dueDate: NSDate())
        ]
        todolists[1].todos = [
            Todo(content: "吃饭", dueDate: NSDate().addingTimeInterval(86400)),
            Todo(content: "睡觉", dueDate: NSDate().addingTimeInterval(86400 * 2))
        ]
        return todolists
    }
}
