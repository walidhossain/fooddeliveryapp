//
//  CartContract.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 14/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation

import UIKit

protocol CartView: IndicatableView {
    var presenter: CartPresentation! { get set }
    
    func showNoContentView()
    func showCart(_ cart:[Food])
}

protocol CartPresentation: class {
    var view:CartView? { get set }
    var interactor: CartUseCase! { get set }
    var router: CartWireframe! { get set }
    
    func viewDidLoad()
    func deleteFood(_ food: Food)
}

protocol CartUseCase: class {
    var output: CartInteractorOutput! { get set }
    
    func sendOrder()
}

protocol CartInteractorOutput: class {
    func orderSent()
    func orderFailed()
}

protocol CartWireframe: class {
    var viewController: UIViewController? { get set }
    
    func clearCartView()
    
    static func assembleModule(_ cart: [Food]) -> UIViewController
}
