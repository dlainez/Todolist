//
//  StatusItemViewController.swift
//  Todolist
//
//  Created by CFPAPP on 23/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

protocol ChangeStatusDelegate {
    func didChangeStatus(Status : Int, Index : Int)
}

class StatusItemViewController: UIViewController {

    var delegate : ChangeStatusDelegate!
    var newStatus : Int!
    var newIndex : Int!
    
    @IBOutlet weak var StatusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        StatusSwitch.on = newStatus == 0 ? false : true
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
            let status = StatusSwitch.on == true ? 1 : 0
            delegate.didChangeStatus(status, Index: newIndex)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

}
