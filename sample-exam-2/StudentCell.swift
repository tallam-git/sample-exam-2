//
//  StudentCellTableViewCell.swift
//  sample-exam-2
//
//  Created by Charan Tallam on 11/13/23.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var studentIV: UIImageView!
    @IBOutlet weak var subTitileLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
