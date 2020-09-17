//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by LAURA JELENICH on 9/17/20.
//  Copyright © 2020 LAURA JELENICH. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?
    
    //MARK - Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    //MARK - Actions
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    func updatButton(_ isComplete: Bool) {
        let imageUpdate = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageUpdate), for: .normal)
    }
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updatButton(task.isComplete)
    }
    
    
    
    
    
    
    
    

}

//extension ButtonTableViewCell {
//    func updatButton(_ isComplete: Bool) {
//        let imageUpdate = isComplete ? "incomplete" : "complete"
//        completeButton.setImage(UIImage(named: imageUpdate), for: .normal)
//    }
//}
