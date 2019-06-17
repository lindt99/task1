//
//  ViewController.swift
//  Todo1
//
//  Created by 本田彩 on 2018/12/31.
//  Copyright © 2018年 本田彩. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var roundAddButton: UIButton!
    @IBOutlet weak var roundBackButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = tasks[indexPath.row].name
        return TodoCell

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tasks.remove(at: indexPath.row)
            let data = try? JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: "TodoList")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("accessory button was tapped")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = tasks[indexPath.row].name
        TodoCell.accessoryType = UITableViewCellAccessoryType.checkmark
        TodoCell.selectionStyle = .none
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        roundAddButton.layer.cornerRadius = 30
        roundAddButton.layer.borderWidth = 1.0
        roundAddButton.layer.borderColor = UIColor(red: 112.0/255.0, green: 112.0/255.0, blue: 112.0/255.0, alpha: 1.0).cgColor
        roundAddButton.clipsToBounds = true
        roundBackButton.layer.cornerRadius = 30
        roundBackButton.layer.borderWidth = 1.0
        roundBackButton.layer.borderColor = UIColor(red: 112.0/255.0, green: 112.0/255.0, blue: 112.0/255.0, alpha: 1.0).cgColor
        roundBackButton.clipsToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let tasksData = UserDefaults.standard.object(forKey: "TodoList") as? Data,
            let temp = try?
                JSONDecoder().decode([Task].self, from:tasksData){
            tasks = temp
        }
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goback(){
        self.dismiss(animated: true)
    }

}

