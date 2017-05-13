//
//  SecondViewController.swift
//  To Do List
//
//  Created by Abdullah Alharbi on 3/9/17.
//  Copyright © 2017 shwares. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var addField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "item")
        
        var items: [String]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
        
            items.append(addField.text!)
            
        } else {
            
            items = [addField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "item")
        
        addField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


}

