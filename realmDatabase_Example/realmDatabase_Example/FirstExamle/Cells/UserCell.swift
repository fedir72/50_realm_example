//
//  UserCell.swift
//  realmDatabase_Example
//
//  Created by fedir on 30.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValueUser(user: ModelUser) {
        namelabel.text = "User: " + user.name
        datelabel.text = "Birdth date: " + user.date
        idLabel.text = "IdCode: \(user.id)"
    }
    
}
