//
//  CartInteractor.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 14/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation
import RxSwift

class CartInteractor: CartUseCase {
    
    weak var output: CartInteractorOutput!
    
    private var disposeBag = DisposeBag()
    
    
    func sendOrder() {
        //ApiManager.sendOrder
    }
    
}
