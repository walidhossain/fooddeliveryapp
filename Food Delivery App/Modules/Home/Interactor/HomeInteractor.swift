//
//  HomeInteractor.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor: HomeUseCase {
    weak var output: HomeInteractorOutput!
    
    private var disposeBag = DisposeBag()
    
    func fetchOffers() {
        ApiManager
            .fetchData(.offer)
            .subscribe(
                onNext:{ data in
                    self.output.offerFecthed(data as! [Offer])
            },
                onError: { error in
                    self.output.offerFecthFailed()
            }
        )
        .disposed(by: disposeBag)
    }
    
    func fetchFoods() {
        ApiManager
            .fetchData(.food)
            .subscribe(
                onNext:{ data in
                    self.output.foodsFecthed(data as! [Food])
            },
                onError: { error in
                    self.output.foodsFecthFailed()
            }
        )
        .disposed(by: disposeBag)
    }
    
}
