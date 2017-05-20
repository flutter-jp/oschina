//
//  Todo.swift
//  TodoList
//
//  Created by xiaomo on 17/5/20.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import Foundation

class Todo {
    var content : String?
    var dueDate : NSDate?
    var todoList : TodoList?
    var complete : Bool?
    
    init(content: String) {
        self.content = content
    }
    
    init(content:String,dueDate:NSDate) {
        self.content = content
        self.dueDate = dueDate
    }
    
}
