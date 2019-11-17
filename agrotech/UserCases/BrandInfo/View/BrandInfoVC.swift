//
//  BrandInfoVC.swift
//  agrotech
//
//  Created by n.shmatov on 13.11.2019.
//  Copyright © 2019 n.shmatov. All rights reserved.
//

import UIKit

class BrandInfoVC: UIViewController {

    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandDescription: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
    var brand: BrandModel = BrandModel(type: .claas, image: nil, name: "", description: "")
    
    func setBrand(brand: BrandModel) {
        self.brand = brand
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension BrandInfoVC {
    func setup() {
        brandName.text = brand.name
        brandDescription.text = brand.description
        brandImage.image = brand.image
        logoImage.image = brand.logo
        
        setupButton()
    }
    
    func setupButton() {
        if !UIDevice.current.isXScreen {
            buttonHeight.constant -= 35
            button.titleEdgeInsets.top = 0
        }
    }
}
