//
//  NewViewController.swift
//  Todo1
//
//  Created by 本田彩 on 2019/01/01.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import QuartzCore
import UIKit

var TodoIndividual = [String]()


class NewViewController: UIViewController {


    @IBOutlet weak var TodoText: UITextField!
    @IBOutlet weak var cornerRoundButton: UIButton!
    @IBOutlet weak var memo: UITextField!
    //@IBOutlet weak var roundButton: UIButton!
    
    @IBOutlet weak var dateTextField: UITextField!
//    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func TodoNew(_ sender: Any) {
        var tasks: [Task] = []
        //take data out from UserDefaults
        if let tasksData = UserDefaults.standard.object(forKey: "TodoList") as? Data,
        //change data type to [Task]
        let temp = try?
            JSONDecoder().decode([Task].self, from:tasksData) {
            tasks = temp
        }
        let task = Task(name: TodoText.text!, deadline: datePicker.date, importance: 0, priority: 0)
        //add new task into Task array
        tasks.append(task)
        let data = try? JSONEncoder().encode(tasks)
        //Save data to userdefaults
        UserDefaults.standard.set(data, forKey: "TodoList")

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
