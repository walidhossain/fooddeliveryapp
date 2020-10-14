//
//  ApiService.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation
import Moya

enum ApiService {
    case food
    case offer
}

extension ApiService: TargetType {
    var baseURL: URL {
        return URL(string: "http://demo3183569.mockable.io")!
    }
    
    var path: String {
        switch self {
        case .food:
            return "/food"
        case .offer:
            return "/offer"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .food, .offer:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .food, .offer:
            return "Sample Data".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .food, .offer:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .food, .offer:
            return ["Conetnt-type":"application/json"]
        }
    }
    
    
}
