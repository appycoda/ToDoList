//
//  FirstViewController.swift
//  To Do List
//
//  Created by Abdullah Alharbi on 3/9/17.
//  Copyright © 2017 shwares. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itemTable: UITableView!
    var items: [String] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // This function is to let the data appear in first view controller
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "item")
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        // to update the screen
        itemTable.reloadData()
        
    }
    
    // to delete a row from tableView
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            itemTable.reloadData()
            
            UserDefaults.standard.set(items, forKey: "item")
        }
    }


}

