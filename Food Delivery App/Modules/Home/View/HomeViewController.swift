//
//  HomeViewController.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var cartButton: UIButton!
    
    
    var presenter: HomePresentation!

    var foods: [Food] = [] {
        didSet {
            if foods.count > 0 {
                tableView.reloadData()
            }
        }
    }
    
    var offers: [Offer] = [] {
        didSet {
            if offers.count > 0 {
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        presenter.didSelectCartButton()
    }
    
    fileprivate func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 480
        
        cartButton.layer.cornerRadius = 22
        cartButton.layer.borderColor = UIColor.lightGray.cgColor
        cartButton.layer.borderWidth = 1.0
    }

    @IBAction func addToCart(_ sender: Any) {
        let buttonPosition = (sender as! UIButton).convert(CGPoint(), to: tableView)
        let index = tableView.indexPathForRow(at: buttonPosition)
        presenter.didClickAddToCartButton(foods[index!.row - 1])
    }
}

extension HomeViewController: HomeView {
    func showNoContentView() {
        
    }
    
    func showDiscountData(_ offers: [Offer]) {
        self.offers = offers
    }
    
    func showFoodData(_ foods: [Food]) {
        self.foods = foods
    }
    
    func updateCart(_ cart: [Food]) {
        cartButton.isHidden = cart.count == 0
        cartButton.setTitle("\(cart.count)", for: UIControl.State.normal)
    }
    
    func showActivityIndicator() {
        
    }
    
    func hideActivityIndicator() {
        
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 600.0
        }else {
            return 480.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            cell.setup(offers)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
            let food = foods[indexPath.row - 1]
            
            cell.selectionStyle = .none
            cell.food = food
            
            return cell
        }
    }
    
}
