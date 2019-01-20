//
//  Task.swift
//  Todo1
//
//  Created by 本田彩 on 2019/01/13.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding{
    
    var name: String
    var deadline: Date
    var priority: Int

    public init(name:String, deadline:Date, priority: Int){
        self.name = name
        self.deadline = deadline
        self.priority = priority
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = (aDecoder.decodeObject(forKey: "name") as? String)!
        deadline = (aDecoder.decodeObject(forKey: "deadline") as? Date)!
        priority = aDecoder.decodeInteger(forKey: "priority")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(deadline, forKey: "deadline")
        aCoder.encode(priority, forKey: "priority")
    }

    
}
