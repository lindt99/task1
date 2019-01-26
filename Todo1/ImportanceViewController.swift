//
//  ImportanceViewController.swift
//  Todo1
//
//  Created by 本田彩 on 2019/01/10.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import UIKit

class ImportanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoIndividual = UserDefaults.standard.object(forKey: "TodoList") as? [String] ?? []
        }
        // Do any additional setup after loading the view.
    }
    
    //完了ボタン
    @IBAction func goback(){
        var tasks: [Task] = []
        for i in 0 ..< tasks.count {
            tasks[i].priority = i
        };
        
        //take data out from UserDefaults
        if let tasksData = UserDefaults.standard.object(forKey: "TodoList") as? Data,
            //change data type to [Task]
            let temp = try?
                JSONDecoder().decode([Task].self, from:tasksData) {
            tasks = temp
        }

        let data = try? JSONEncoder().encode(tasks)
        //Save data to userdefaults
        UserDefaults.standard.set(data, forKey: "TodoList")
        
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

//        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 並び替え対象のタスクを取得
        let targetTask = tasks[sourceIndexPath.row]
        // 並び替えるタスクをもともと居た順番から削除
        tasks.remove(at: sourceIndexPath.row)
        // 挿入したい位置に並び替え対象のタスクを挿入
        tasks.insert(targetTask, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
