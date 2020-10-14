//
//  ViewProtocols.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}
