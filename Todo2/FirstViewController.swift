//
//  FirstViewController.swift
//  Todo1
//
//  Created by 本田彩 on 2019/02/01.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var tasks: [Task] = []
    
    @IBOutlet weak var cornerRoundButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let tasksData = UserDefaults.standard.object(forKey: "TodoList") as? Data,
//            let temp = try?
//                JSONDecoder().decode([Task].self, from:tasksData){
//            tasks = temp
//        }
//        nameTextField?.text = tasks[0].name
//        dateFormatter.locale = Locale(identifier: "ja_JP")
//        dateTextField.text = dateFormatter.string(for: tasks[0].deadline)
        
        
        cornerRoundButton.layer.cornerRadius = 30
        cornerRoundButton.layer.borderWidth = 1.0
        cornerRoundButton.layer.borderColor = UIColor(red: 112.0/255.0, green: 112.0/255.0, blue: 112.0/255.0, alpha: 1.0).cgColor
        cornerRoundButton.clipsToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let tasksData = UserDefaults.standard.object(forKey: "TodoList") as? Data,
            let temp = try?
                JSONDecoder().decode([Task].self, from:tasksData){
            tasks = temp
        }
        if (tasks.count == 0) {
            nameTextField?.text = "登録されている"
            dateTextField.text = "タスクはありません"
        }
        else{
        nameTextField?.text = tasks[0].name
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateTextField.text = dateFormatter.string(for: tasks[0].deadline)
        }
        print(tasks)
    }
    //Study for exam 
    //Write report
    //Pack for trip
    //Make presentation
    //Submit schedule
    @IBAction func nextTask() {
        
        tasks.removeFirst()
        let data = try? JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: "TodoList")
        if (tasks.count > 1) {
            
            nameTextField?.text = tasks[0].name
            dateFormatter.locale = Locale(identifier: "ja_JP")
            dateTextField.text = dateFormatter.string(for: tasks[0].deadline)
        }
        else if (tasks.count == 0) {
            nameTextField?.text = "全てのタスクが"
            dateTextField.text = "終わりました！"
        }
        else{
            nameTextField?.text = tasks[0].name
            dateFormatter.locale = Locale(identifier: "ja_JP")
            dateTextField.text = dateFormatter.string(for: tasks[0].deadline)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        return formatter
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
