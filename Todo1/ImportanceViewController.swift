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
//        tasks[indexPath.row].priority.sort(by:{$0<tasks.count})
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
        
//        calculateDate()
        //1. 重要度tableviewに表示されている順番でpriorityを更新
        for i in 0 ..< tasks.count {
            tasks[i].importance = i+1
        };
        //2. deadline順にtasksを並び替えて緊急度を更新
        tasks.sort { (first, second) -> Bool in
            first.importance<second.importance
        }
        //3.緊急度を更新
        for i in 0 ..< tasks.count{
            tasks[i].urgency = i
            
            //4. タスクごとにpriorityと緊急度で優先順位を計算
            tasks[i].priority = tasks[i].importance+tasks[i].urgency
        }
        
        
        //5. tasksをUserDefaultsに保存
        let data = try? JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: "TodoList")
        
//        calculatePriority()
        
        for task in tasks {
            print("name: \(task.name), deadline: \(task.deadline), urgency: \(task.urgency), importance: \(task.importance), priority: \(task.priority)")
        }
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)


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
    
    //    func calculateDate(){
    //        let now = Date() //現在の日付時刻を取得
    //        var taskDate: Date //変数を日付として定義
    //        var diffInDays: Date
    //        for i in 0 ..< tasks.count {
    //            taskDate = tasks[i].deadline //各タスクの期限をtaskDateと定義
    //
    //            let diffInDays = Calendar.current.dateComponents([.day], from: now, to: taskDate).day ?? 0 //今日の日付時刻と各タスクの機嫌を比較して日数を返す
    //            let timeInterval = Int(diffInDays) //diffInDaysを整数型に変換
    //            tasks[i].daysleft = timeInterval //timeIntervalをdaysleftに置き換える
    ////            print(tasks[i].daysleft)
    //        };
    //    }
    
    //    func calculatePriority(){
    //        UserDefaults.standard.object(forKey: "TodoList")
    //        for i in 0 ..< tasks.count {
    //            let daysleft = tasks[i].daysleft
    //            let importance = tasks[i].importance
    //            let pri = daysleft + importance
    //            print(pri)
    //        };
    //
    //    }

}
