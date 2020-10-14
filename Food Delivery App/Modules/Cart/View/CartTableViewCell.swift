//
//  CartTableViewCell.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 14/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var food:Food = Food(){
        didSet{
            nameLabel.text = food.name
            priceLabel.text = "\(food.price!) usd"
            
            if let imageurl = food.imageUrl {
                foodImageView.sd_setImage(with: URL(string: imageurl), placeholderImage: UIImage(named: "pizza"))
            }
        }
    }

}
