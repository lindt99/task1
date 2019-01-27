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
    var importance: Int
    var priority: Int
    
    public init(name:String, deadline:Date, importance: Int, priority: Int){
        self.name = name
        self.deadline = deadline
        self.importance = importance
        self.priority = priority
    }
}
