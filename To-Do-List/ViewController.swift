//
//  ViewController.swift
//  To-Do-List
//
//  Created by Abby Tse on 5/29/20.
//  Copyright © 2020 Abby Tse. All rights reserved.
//
import UserNotifications
import UIKit

var tasks = [String]()
var models = [MyReminder]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return (models.count)
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
            
        cell.textLabel?.text=models[indexPath.row].title
            
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            models.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "entry")
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
            if success{
                print("Success!")
            } else if error != nil{
                print("Error occurred")
            }
        })
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

struct MyReminder{
    let title:String
    let date:Date
    let identifier:String
}
