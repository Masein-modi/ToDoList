//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Masein Mody on 3/18/18.
//  Copyright © 2018 Masein Mody. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    @IBOutlet weak var toDoListTable: UITableView!
    var toDoListArray : [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "toDoCell")
        cell.textLabel?.text = toDoListArray[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoListArray = UserDefaults.standard.object(forKey: "toDoListArray") as! [String]
        toDoListTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            toDoListArray.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(toDoListArray, forKey: "toDoListArray")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

