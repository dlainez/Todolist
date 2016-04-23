//
//  ListTableViewCell.swift
//  Todolist
//
//  Created by CFPAPP on 23/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate {
    func shouldChangeStatusCell(Index : Int)
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleCell: UILabel!
    @IBOutlet weak var ImageCell: UIImageView!
    
    var IndexSwitch : Int = 0
    var delegate : ListTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setGestureActive() {
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "ChangeStatusAction:")
        ImageCell.addGestureRecognizer(gestureRecognizer)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func ChangeStatusAction(gestureRecognizer: UIGestureRecognizer) {
        if let delegate = delegate {
            delegate.shouldChangeStatusCell(IndexSwitch)
        }
    }

}
