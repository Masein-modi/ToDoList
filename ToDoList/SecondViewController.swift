//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Masein Mody on 3/18/18.
//  Copyright © 2018 Masein Mody. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UITextField!
    var toDoListArray : [String] = []
    
    @IBAction func addToToDOList(_ sender: Any) {
        if let text = label.text {
            if let items = UserDefaults.standard.object(forKey: "toDoListArray") as? [String]{
                toDoListArray = items
            }
            toDoListArray.append(text)
            UserDefaults.standard.set(toDoListArray , forKey: "toDoListArray")
            label.text = nil
        }else{
            print("emptyText ...",label.text as Any)
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

