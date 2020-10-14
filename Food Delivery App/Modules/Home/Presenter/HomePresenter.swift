//
//  HomePresenter.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation

class HomePresenter: HomePresentation {
    
    weak var view: HomeView?
    var interactor: HomeUseCase!
    var router: HomeWireframe!
    
    var foods: [Food] = [] {
        didSet {
            if foods.count > 0 {
                view?.showFoodData(foods)
            }else {
                view?.showNoContentView()
            }
        }
    }
    
    var offers: [Offer] = [] {
        didSet {
            if offers.count > 0 {
                view?.showDiscountData(offers)
            }
        }
    }
    
    var cart:[Food] = [] {
        didSet {
            if cart.count > 0 {
                view?.updateCart(cart)
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchFoods()
        interactor.fetchOffers()
    }
    
    func didClickAddToCartButton(_ food: Food) {
        cart.append(food)
    }
    
    func didSelectCartButton() {
        router.presentCartView(cart)
    }
    
    func didSwipeLeft() {
        
    }
    
    func didSwipeRight() {
        
    }
    
    
}

extension HomePresenter : HomeInteractorOutput {
    func foodsFecthed(_ foods: [Food]) {
        self.foods = foods
        view?.hideActivityIndicator()
    }
    
    func foodsFecthFailed() {
        
    }
    
    func offerFecthed(_ offers: [Offer]) {
        self.offers = offers
        view?.hideActivityIndicator()
    }
    
    func offerFecthFailed() {
        
    }
    
    
}
