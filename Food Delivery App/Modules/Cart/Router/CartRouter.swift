//
//  CartRouter.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 14/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

class CartRouter: CartWireframe {
    
    weak var viewController: UIViewController?
    
    func clearCartView() {
        
    }
    
    static func assembleModule(_ cart: [Food]) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "CartStoryboard", bundle: Bundle.main)
        let cartViewController = storyboard.instantiateViewController(identifier: "CartViewController") as CartViewController
        let presenter = CartPresenter()
        presenter.cart = cart
        let interactor = CartInteractor()
        let router = CartRouter()
        
        cartViewController.presenter =  presenter
        
        presenter.view = cartViewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = cartViewController
        
        return cartViewController
    }
}
