//
//  customeTableViewCell.swift
//  TableViewWithMultipeSectionsAndRows
//
//  Created by FCI on 27/11/24.
//

import UIKit

class customeTableViewCell: UITableViewCell {

    @IBOutlet var label1: UILabel!
    @IBOutlet var iv1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
