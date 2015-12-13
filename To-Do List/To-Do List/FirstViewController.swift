//
//  FirstViewController.swift
//  To-Do List
//
//  Created by Antrromet on 12/13/15.
//  Copyright © 2015 Antrromet. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = (todoList[indexPath.row])
        return cell;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoList.removeAtIndex(indexPath.row)
            tableView.reloadData()
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "list")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("list") != nil {
            todoList = NSUserDefaults.standardUserDefaults().objectForKey("list") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }


}

