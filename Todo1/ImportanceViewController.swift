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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoIndividual.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = TodoIndividual[indexPath.row]
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
    
    @IBAction func goback(){
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // TODO: 入れ替え時の処理を実装する（データ制御など）
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let TodoIndividual = UserDefaults.standard.object(forKey: "TodoList") as? [String] ?? []
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
