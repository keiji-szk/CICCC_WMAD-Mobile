//
//  ToDoCell.swift
//  ToDoList
//
//  Created by 鈴木啓司 on 2022-05-17.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
  
  weak var delegate: ToDoCellDelegate?
  
  @IBAction func completeButtonTapped(_ sender: UIButton) {
    delegate?.checkmarkTapped(sender: self)
  }
  
  
  @IBOutlet var isCompleteButton: UIButton!
  @IBOutlet var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  
  
}
