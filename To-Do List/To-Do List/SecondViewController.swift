//
//  SecondViewController.swift
//  To-Do List
//
//  Created by Antrromet on 12/13/15.
//  Copyright © 2015 Antrromet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemLabel: UITextField!
    
    @IBAction func addItemPressed(sender: AnyObject) {
        let todoItem = itemLabel.text
        if todoItem == nil {
            let alert = UIAlertController(title: "Alert", message: "Item cannot be empty!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            todoList.append(todoItem!)
            itemLabel.text = ""
            print(todoList)
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "list")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemLabel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        itemLabel.resignFirstResponder()
        
        return true
    }

}

