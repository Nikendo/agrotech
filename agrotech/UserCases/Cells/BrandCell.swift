//
//  BrandCell.swift
//  agrotech
//
//  Created by n.shmatov on 17.11.2019.
//  Copyright © 2019 n.shmatov. All rights reserved.
//

import UIKit

class BrandCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var logotip: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension BrandCell {
    func configure(text: String, image: UIImage?) {
        selectionStyle = .none
        companyName.text = text
        logotip.image = image
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.3
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 2
        backView.layer.masksToBounds = false
    }
}
