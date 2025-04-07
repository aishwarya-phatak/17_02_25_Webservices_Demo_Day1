//
//  CommentTableViewCell.swift
//  17_02_25_Webservices_Demo_Day1
//
//  Created by Vishal Jagtap on 07/04/25.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentIdLabel: UILabel!
    @IBOutlet weak var commentEmailLabel: UILabel!
    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }
    
}
