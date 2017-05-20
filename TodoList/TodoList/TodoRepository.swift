//
//  TodoRepository.swift
//  TodoList
//
//  Created by xiaomo on 17/5/20.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import Foundation

class TodoRepository {
    
    func findAllItems()->[(String,NSDate)]{
        return [
            ("吃饭", NSDate()),
            ("睡觉", NSDate().addingTimeInterval(86400)),
            ("抢银行", NSDate().addingTimeInterval(86400 * 2))
        ]
    }
}
