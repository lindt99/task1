//
//  NewViewController.swift
//  Todo1
//
//  Created by 本田彩 on 2019/01/01.
//  Copyright © 2019年 本田彩. All rights reserved.
//

import UIKit

var TodoIndividual = [String]()

class NewViewController: UIViewController {


    @IBOutlet weak var TodoText: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    //@IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func TodoNew(_ sender: Any) {
        TodoIndividual.append(TodoText.text!)
        TodoText.text = ""
        UserDefaults.standard.set(TodoIndividual, forKey:"ToDoList")
        self.dismiss(animated: true)
    }
    
    @IBAction func goback(){
        self.dismiss(animated: true)
    }
    
    //Pick date
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
        // Do any additional setup after loading the view.
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
