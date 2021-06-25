//
//  EmployeeCell.swift
//  Task
//
//  Created by Abhishek on 01/05/21.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblEmail : UILabel!
    @IBOutlet weak var lblBody : UILabel!
    @IBOutlet weak var vwFrame : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
