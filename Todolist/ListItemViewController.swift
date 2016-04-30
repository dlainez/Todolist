//
//  ListItemViewController.swift
//  Todolist
//
//  Created by CFPAPP on 22/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddItemDelegate, ChangeStatusDelegate, ChangeTitleDelegate ,ListTableViewCellDelegate {

    var delegate : AddItemViewController!
    var ListadoVC = [Lista]()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //containerView.hidden = ListadoVC.count == 0 ? false : true
        
        if let outData = defaults.objectForKey("KeyListadoVC") as? NSData {
            if let outClase = NSKeyedUnarchiver.unarchiveObjectWithData(outData) as? [Lista] {
                ListadoVC = outClase
            }
        }
        
        containerView.hidden = ListadoVC.count == 0 ? false : true
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        containerView.hidden = ListadoVC.count == 0 ? false : true
        tableView.reloadData()
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
        
        if segue.identifier == "ShowChangeStatusSegue" {
            if let destinationVC = segue.destinationViewController as? StatusItemViewController {
                destinationVC.delegate = self
                if let index = sender as? Int {
                    destinationVC.newStatus = ListadoVC[index].Flag
                    destinationVC.newIndex = index
                }
            }
        }
        
        if segue.identifier == "ShowEditSegue" {
            if let destinationVC = segue.destinationViewController as? EditNavigationViewController {
                destinationVC.delegateEdit = self
                if let index = sender as? Int {
                    destinationVC.defaultText = ListadoVC[index].title
                    destinationVC.defaultIndex = index
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            ListadoVC.removeAtIndex(indexPath.row)
            
            let inClase = NSKeyedArchiver.archivedDataWithRootObject(ListadoVC)
            defaults.setObject(inClase, forKey: "KeyListadoVC")
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let editButton = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Edit") { (rowAction: UITableViewRowAction, indexPath : NSIndexPath) -> Void in
            self.performSegueWithIdentifier("ShowEditSegue", sender: indexPath.row)
        }
        
        let deleteButton = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Delete") { (rowAction: UITableViewRowAction, indexPath : NSIndexPath) -> Void in
            self.tableView(self.tableView, commitEditingStyle: UITableViewCellEditingStyle.Delete, forRowAtIndexPath: indexPath)
        }
        
        return [deleteButton, editButton]
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListadoVC.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("ItemCell")!
        
        let item = ListadoVC[indexPath.row]
        
        if let cell = tableViewCell as? ListTableViewCell {
            cell.TitleCell.text = item.title
            cell.ImageCell.image = item.Flag == 0 ? UIImage(named: "icon-dog-red")! : UIImage(named: "icon-dog-green")!
            cell.delegate = self
            cell.IndexSwitch = indexPath.row
            cell.setGestureActive()
        }
        
        return tableViewCell
    }
    
    //AddItemDelegate
    
    func didAddItem(item: Lista) {
        ListadoVC.append(item)
        
        let inClase = NSKeyedArchiver.archivedDataWithRootObject(ListadoVC)
        defaults.setObject(inClase, forKey: "KeyListadoVC")
        
        containerView.hidden = ListadoVC.count == 0 ? false : true
        
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow : ListadoVC.count - 1, inSection : 0 )], withRowAnimation: UITableViewRowAnimation.Right)
    }
    
    //ChangeStatusDelegate
    
    func didChangeStatus(Status: Int, Index : Int) {
        ListadoVC[Index].Flag = Status
        
        let inClase = NSKeyedArchiver.archivedDataWithRootObject(ListadoVC)
        defaults.setObject(inClase, forKey: "KeyListadoVC")
        
        tableView.reloadData()
    }
    
    //ListTableViewCellDelegate
    
    func shouldChangeStatusCell(Index: Int) {
        self.performSegueWithIdentifier("ShowChangeStatusSegue", sender: Index)
    }
    
    //ChangeTitleDelegate
    func didChangeTitle(Title: String, Index: Int) {
        ListadoVC[Index].title = Title
        
        let inClase = NSKeyedArchiver.archivedDataWithRootObject(ListadoVC)
        defaults.setObject(inClase, forKey: "KeyListadoVC")
        
        tableView.reloadData()
    }

}
