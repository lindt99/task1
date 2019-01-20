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
    var priority: Int
    
    public init(name:String, deadline:Date, priority: Int){
        self.name = name
        self.deadline = deadline
        self.priority = priority
    }
}
