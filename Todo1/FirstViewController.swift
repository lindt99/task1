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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TodoIndividual = UserDefaults.standard.object(forKey: "TodoList") as? [String] ?? []
        nameTextField.text = tasks[0].name
//        dateTextField.text = String(describing: tasks[0].deadline)
        
        
        cornerRoundButton.layer.cornerRadius = 30
        cornerRoundButton.layer.borderWidth = 1.0
        cornerRoundButton.layer.borderColor = UIColor(red: 112.0/255.0, green: 112.0/255.0, blue: 112.0/255.0, alpha: 1.0).cgColor
        cornerRoundButton.clipsToBounds = true
        // Do any additional setup after loading the view.
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
