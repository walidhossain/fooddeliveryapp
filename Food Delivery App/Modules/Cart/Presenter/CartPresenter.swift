//
//  CartPresenter.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 14/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation

class CartPresenter: CartPresentation {
    
    weak var view: CartView?
    var interactor: CartUseCase!
    var router: CartWireframe!
    
    var cart:[Food] = [] {
        didSet {
            if cart.count > 0 {
                view?.showCart(cart)
            }
        }
    }
    
    func viewDidLoad() {
        view?.showCart(cart)
    }
    
    func deleteFood(_ food: Food) {
        if let index = cart.firstIndex(where: { $0.id == food.id}) {
            cart.remove(at: index)
        }
    }
}

extension CartPresenter : CartInteractorOutput {
    func orderSent() {
        
    }
    
    func orderFailed() {
        
    }
    
    
}
