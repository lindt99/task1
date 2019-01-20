//
//  NewViewController.swift
//  Todo1
//
//  Created by 本田彩 on 2019/01/01.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import UIKit

var TodoIndividual = [String]()
//var task = [String(), Date(), Int()] as [Any]

class NewViewController: UIViewController {


    @IBOutlet weak var TodoText: UITextField!
    @IBOutlet weak var cornerRoundButton: UIButton!
    //@IBOutlet weak var roundButton: UIButton!
    
    @IBOutlet weak var dateTextField: UITextField!
//    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func TodoNew(_ sender: Any) {
        var tasks: [Task] = []
        if let tasksData = UserDefaults.standard.object(forKey: "TodoList") as? Data,
        let temp = try?
            JSONDecoder().decode([Task].self, from:tasksData) {
            tasks = temp
        }
        let task = Task(name: TodoText.text!, deadline: datePicker.date, priority: 0)
        tasks.append(task)
        let data = try? JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: "TodoList")
        
//        var tasks = UserDefaults.standard.object(forKey: "TodoList") as? [Task] ?? []
//        let task = Task(name: TodoText.text!, deadline: datePicker.date, priority:0)
//        tasks.append(task)
//        UserDefaults.standard.set(tasks, forKey: "TodoList")

    }
    
    @IBAction func goback(){
        self.dismiss(animated: true)
    }
    
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        return picker
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        var datePicker: UIDatePicker = {
            let picker = UIDatePicker()
            picker.datePickerMode = .date
            picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
            return picker
        }()
        
        var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }()
        dateTextField.inputView = datePicker
        cornerRoundButton.layer.cornerRadius = 20
        cornerRoundButton.layer.borderWidth = 1.0
        cornerRoundButton.layer.borderColor = UIColor(red: 112.0/255.0, green: 112.0/255.0, blue: 112.0/255.0, alpha: 1.0).cgColor
        cornerRoundButton.clipsToBounds = true
        
    }
    @objc func datePickerChanged(_ sender: UIDatePicker){
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //close datepicker when clicked
        view.endEditing(true)
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
