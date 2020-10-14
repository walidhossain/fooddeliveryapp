//
//  HomeRouter.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

class HomeRouter: HomeWireframe {
    weak var viewController: UIViewController?
    
    func presentFoodType() {
        
    }
    
    func presentCartView(_ cart: [Food]) {
        let cartViewController = CartRouter.assembleModule(cart)
        viewController?.navigationController?.pushViewController(cartViewController, animated: true)
    }
    
    static func assembleModule() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "HomeStoryboard", bundle: Bundle.main)
        let homeViewController = storyboard.instantiateViewController(identifier: "HomeViewController") as HomeViewController
        let navigationController = UINavigationController(rootViewController: homeViewController)
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        homeViewController.presenter =  presenter
        
        presenter.view = homeViewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = homeViewController
        
        return navigationController
    }
}
