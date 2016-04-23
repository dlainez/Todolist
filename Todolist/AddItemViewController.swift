//
//  AddItemViewController.swift
//  Todolist
//
//  Created by CFPAPP on 22/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
    func didAddItem(item : Lista)
}

class AddItemViewController: UIViewController {
    
    var delegate : AddItemDelegate!
    var defaults = NSUserDefaults.standardUserDefaults()
    var ListaVC = [Lista]()
    
    
    @IBOutlet weak var ItemText: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    @IBOutlet weak var CancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func Save(sender: AnyObject) {
        //if let newTitle = sender as? UITextField {
            let item = Lista()
            
            item.title = ItemText.text
            
            dismissViewControllerAnimated(true) {
                if let delegate = self.delegate {
                    delegate.didAddItem(item)
                }
            }
        //}
    }

    @IBAction func Cancel(sender: AnyObject) {
        
    }
    
}
