//
//  EntryViewController.swift
//  To-Do-List
//
//  Created by Abby Tse on 5/30/20.
//  Copyright © 2020 Abby Tse. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var field:UITextField!
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if(field.text != ""){
            tasks.append(field.text!)
            field.text = ""
            navigationController?.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
