//
//  Task.swift
//  Todo1
//
//  Created by 本田彩 on 2019/01/13.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import Foundation

class Task: Codable{
    
    var name: String
    var deadline: Date
    var daysleft: Int
    var importance: Int
    var priority: Int
    
    public init(name:String, deadline:Date, daysleft:Int, importance: Int, priority: Int){
        self.name = name
        self.deadline = deadline
        self.daysleft = daysleft
        self.importance = importance
        self.priority = priority
    }
}
