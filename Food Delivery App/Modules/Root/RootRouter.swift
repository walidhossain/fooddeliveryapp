//
//  RootRouter.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    func presentHomeView(in window:UIWindow){
        window.rootViewController = HomeRouter.assembleModule()
        window.makeKeyAndVisible()
    }
}
