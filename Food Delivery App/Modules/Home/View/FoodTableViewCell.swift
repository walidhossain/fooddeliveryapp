//
//  FoodTableViewCell.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit
import SDWebImage

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var food:Food = Food(){
        didSet{
            nameLabel.text = food.name
            descriptionLabel.text = food.description
            sizeLabel.text = food.size
            nameLabel.superview?.roundCorners([.allCorners], radius: 15)
            
            button.setTitle("\(food.price!) usd", for: UIControl.State.normal)
            button.layer.cornerRadius = 15
            
            if let imageurl = food.imageUrl {
                foodImageView.sd_setImage(with: URL(string: imageurl), placeholderImage: UIImage(named: "pizza"))
            }
        }
    }

}
