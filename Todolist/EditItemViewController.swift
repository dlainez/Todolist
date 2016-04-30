//
//  EditItemViewController.swift
//  Todolist
//
//  Created by CFPAPP on 29/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

protocol ChangeTitleDelegate {
    func didChangeTitle(Title : String, Index : Int)
}

class EditItemViewController: UIViewController {

    var delegate : ChangeTitleDelegate!
    var newTitle : String!
    var newIndex : Int!
    
    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    @IBOutlet weak var TitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TitleTextField.text = newTitle
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
    @IBAction func SaveAction(sender: AnyObject) {
        if let delegate = self.delegate {
            let title = TitleTextField.text == nil ? newTitle : TitleTextField.text
            delegate.didChangeTitle(title, Index: newIndex)
        }
        self.dismissViewControllerAnimated(true) {
            
        }
    }
    
    
    @IBAction func CancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) {
            
        }

    }

}
