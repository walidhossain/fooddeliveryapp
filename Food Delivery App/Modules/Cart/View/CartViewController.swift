//
//  CartViewController.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 14/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var presenter: CartPresentation!
    
    var cart: [Food] = [] {
        didSet {
            if cart.count > 0 {
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 72
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        let food = cart[indexPath.row]
        cell.selectionStyle = .none
        cell.food = food
        
        return cell
    }
    
    
}

extension CartViewController: CartView {
    
    func showNoContentView() {
        
    }
    
    func showCart(_ cart: [Food]) {
        self.cart = cart
    }
    
    func showActivityIndicator() {
        
    }
    
    func hideActivityIndicator() {
        
    }
    
    
}
