//
//  HomeContract.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

protocol HomeView: IndicatableView {
    var presenter: HomePresentation! { get set }
    
    func showNoContentView()
    func showDiscountData(_ offers:[Offer])
    func showFoodData(_ foods:[Food])
    func updateCart(_ cart:[Food])
}

protocol HomePresentation: class {
    var view:HomeView? { get set }
    var interactor: HomeUseCase! { get set }
    var router: HomeWireframe! { get set }
    
    func viewDidLoad()
    func didClickAddToCartButton(_ food: Food)
    func didSelectCartButton()
    func didSwipeLeft()
    func didSwipeRight()
}

protocol HomeUseCase: class {
    var output: HomeInteractorOutput! { get set }
    
    func fetchOffers()
    func fetchFoods()
}

protocol HomeInteractorOutput: class {
    func foodsFecthed(_ foods: [Food])
    func foodsFecthFailed()
    
    func offerFecthed(_ offers: [Offer])
    func offerFecthFailed()
}

protocol HomeWireframe: class {
    var viewController: UIViewController? { get set }
    
    func presentFoodType()
    func presentCartView(_ cart: [Food])
    
    static func assembleModule() -> UIViewController
}
