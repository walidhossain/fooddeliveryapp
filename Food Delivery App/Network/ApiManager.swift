//
//  ApiManager.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

class ApiManager {
    static func fetchData(_ serviceType:ApiService) -> Observable<[Entity]> {
        return Observable<[Entity]>.create { observer -> Disposable in
            let provider = MoyaProvider<ApiService>()
            let request = provider
                .rx
                .request(serviceType)
                .subscribe{ event in
                switch event {
                    case let .success(response):
                        do {
                            switch serviceType {
                            case .food:
                                observer.onNext(try response.mapArray(Food.self))
                            case .offer:
                                observer.onNext(try response.mapArray(Offer.self))
                            }
                        } catch {
                            observer.onNext([])
                        }
                        observer.onCompleted()
                    case let .error(error):
                        observer.onError(error)
                }
            }
            
            return Disposables.create(with: {
                request.dispose()
            })
        }
    }
}
