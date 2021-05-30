//
//  PostTableCell.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

class PostTableCell: UITableViewCell {
    
    //MARK:- Outlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
