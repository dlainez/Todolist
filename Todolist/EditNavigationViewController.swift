//
//  EditNavigationViewController.swift
//  Todolist
//
//  Created by CFPAPP on 30/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

class EditNavigationViewController: UINavigationController {

    var defaultText : String!
    var defaultIndex : Int!
    var delegateEdit : ChangeTitleDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let vc = self.topViewController as? EditItemViewController {
            vc.delegate = delegateEdit
            vc.newTitle = defaultText
            vc.newIndex = defaultIndex
        }
        
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

}
