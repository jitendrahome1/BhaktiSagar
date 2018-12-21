//
//  SliderMenuCell.swift
//  BhaktiSagar
//
//  Created by Jitendra Kumar Agarwal on 21/12/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class SliderMenuCell: BaseTableViewCell {

    @IBOutlet var imgMenu: UIImageView!
    
    @IBOutlet var viewBG: UIView!
    @IBOutlet var lblMenuTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
