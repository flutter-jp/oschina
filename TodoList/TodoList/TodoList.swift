//
//  Todolist.swift
//  TodoList
//
//  Created by xiaomo on 17/5/20.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import Foundation

class TodoList {
    
    var content : String?
    var todos : [Todo]?
    
    init(content : String) {
        self.content = content
    }
}
