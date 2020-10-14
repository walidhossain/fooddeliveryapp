//
//  ProblemSolving.swift
//  
//
//  Created by Walid Hossain on 14/10/20.
//

import Foundation

func letterShift(_ str:String, _ n: Int)-> String {
    let characters: [Character] = ["a","b","c","d","e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var result = ""
    
    for char in str {
        if let index = characters.firstIndex(where: { $0 == char }){
            let newIndex = (index + n) % characters.count
            result += "\(characters[newIndex])"
        }
    }
    
    return result
}
