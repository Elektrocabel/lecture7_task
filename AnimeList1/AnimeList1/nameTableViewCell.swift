//
//  nameTableViewCell.swift
//  AnimeList1
//
//  Created by Sierra on 31.10.2018.
//  Copyright © 2018 Sergey Ovchinnikov. All rights reserved.
//

import UIKit

class nameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var epicouLabel: UILabel!
    @IBOutlet var nameImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
