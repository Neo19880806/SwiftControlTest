//
//  MyTableViewCell.swift
//  CustomizeTableViewCell
//
//  Created by liang on 4/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

  @IBOutlet weak var imgPost: UIImageView!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblYear: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
