//
//  ListItemViewController.swift
//  Todolist
//
//  Created by CFPAPP on 22/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddItemDelegate {

    var delegate : AddItemViewController!
    var ListadoVC = [Lista]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {

        containerView.hidden = ListadoVC.count == 0 ? false : true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowAddItemSegue" {
            if let destinationVC = segue.destinationViewController as? AddItemViewController {
                destinationVC.delegate = self
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListadoVC.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("ItemCell")!
        
        let item = ListadoVC[indexPath.row]
        
        tableViewCell.textLabel?.text = item.title
        
        return tableViewCell
    }
    
    //AddItemDelegate
    
    func didAddItem(item: Lista) {
        ListadoVC.append(item)
         containerView.hidden = ListadoVC.count == 0 ? false : true
        tableView.reloadData()
    }

}
