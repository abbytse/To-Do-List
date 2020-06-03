//
//  EntryViewController.swift
//  To-Do-List
//
//  Created by Abby Tse on 5/30/20.
//  Copyright © 2020 Abby Tse. All rights reserved.
//

import UIKit

//public var completion: ((String,Date) -> Void)?

class EntryViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var field:UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if(field.text != ""){
            //tasks.append(field.text!)
            //field.text = ""
            
            //_completion?(field.text!, datePicker.date)
            
            let new = MyReminder(title: field.text!, date: datePicker.date, identifier: "id_\(title)")
            models.append(new)
                    
            let content = UNMutableNotificationContent()
            content.title = field.text!
            content.sound = .default
            content.body = "Reminder to complete this task!"
                    
            let targetDate = datePicker.date
                    
            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
                    
            let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
            
            field.text = ""
                    
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                if error != nil{
                    print("something went wrong")
                }
            })
        }
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
