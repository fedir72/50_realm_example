//
//  SecondCell.swift
//  realmDatabase_Example
//
//  Created by fedir on 31.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setupCell(item: SecondModel) {
        idLabel.text = item.id
        nameLabel.text = item.name
    }
    
}
