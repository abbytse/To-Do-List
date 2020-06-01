//
//  EntryViewController.swift
//  To-Do-List
//
//  Created by Abby Tse on 5/30/20.
//  Copyright © 2020 Abby Tse. All rights reserved.
//

import UIKit

/*
protocol  AddTask {
    func addTask(name:String)
}
*/

class EntryViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var field:UITextField!
    
    //var update: (() -> Void)?
    
    /*
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if(field.text != ""){
            delegate?.addTask(name: (field?.text!)!)
            navigationController?.popViewController(animated: true)
        }
    }
    */
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if(field.text != ""){
            tasks.append(field.text!)
            field.text = ""
            navigationController?.popViewController(animated: true)
        }
    }
    
    //var delegate: AddTask?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
    
    func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        saveTask()
        return true
    }
    
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else{
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as?Int else{
            return
        }

        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(newCount, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
     */
    
}
