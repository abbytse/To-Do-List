//
//  ViewController.swift
//  To-Do-List
//
//  Created by Abby Tse on 5/29/20.
//  Copyright © 2020 Abby Tse. All rights reserved.
//

import UIKit

var tasks = ["Buy milk", "Run 5 miles", "Get Peter", "Plant my new plants"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    //var tasks = [String]()
    //var tasks = ["Buy milk", "Hello"]
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (tasks.count)
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        //let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
            
        cell.textLabel?.text=tasks[indexPath.row]
            
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.delegate = self
        tableView.dataSource = self
            /*
         self.title = "Tasks"
            //Setup
            if !UserDefaults().bool(forKey: "setup"){
                UserDefaults().set(true, forKey: "setup")
                UserDefaults().set(0, forKey: "count")
            }
            
            updateTasks()
             */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EntryViewController
        vc.delegate = self
    }
    
    func addTask(name:String){
        tasks.append(name)
        tableView.reloadData()
    }
 */
    
    @IBAction func didTapAdd(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "entry")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    @objc public func didTapAdd(_ sender: UIBarButtonItem)
    {
        // Create an alert
        let alert = UIAlertController(
            title: "New to-do item",
            message: "Insert the title of the new to-do item:",
            preferredStyle: .alert)

        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)

        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text
            {
                self.addNewToDoItem(title: title)
            }
        }))

        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }

    private func addNewToDoItem(title: String)
    {
        // The index of the new item will be the current item count
        let newIndex = tasks.count

        // Create new item and add it to the todo items list
        tasks.append(title)

        // Tell the table view a new row has been created
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    */
    
    /*
    @IBAction func didTapAdd(){
        //let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController else { return }
        //vc.delegate = self
        //vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        //}
        //navigationController?.pushViewController(vc, animated: true)
    }
        
    func updateTasks(){
        /*
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as?Int else {
            return
        }
        
        for x in 0..<count{
            if let task = UserDefaults().value(forKey: "task_\(x+1)")as?String{
                tasks.append(task)
            }
        }
        
        self.tableView.reloadData()
        */
        // The index of the new item will be the current item count
        let newIndex = tasks.count

        // Create new item and add it to the todo items list
        tasks.append(title!)

        // Tell the table view a new row has been created
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
 */

}
