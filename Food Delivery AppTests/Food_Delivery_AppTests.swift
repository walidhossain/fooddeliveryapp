//
//  Food_Delivery_AppTests.swift
//  Food Delivery AppTests
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import XCTest
import RxSwift
@testable import Food_Delivery_App

class Food_Delivery_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiService() throws {
        let disposeBag = DisposeBag()
        ApiManager.fetchData(.food).subscribe(
            onNext:{ data in
                print("here")
        },
            onError: { error in
                print(error.localizedDescription)
        }
        ).disposed(by: disposeBag)
    }

}
