//
//  Calculation.swift
//  Calculator
//
//  Created by Siddique on 10/12/17.
//  Copyright © 2017 Siddique. All rights reserved.
//

import Foundation

class Number{
    var items = [String]()
    var heap: Double = 0.0
    var addSub: Double = 0.0
    var muldiv: Double = 1.0
    var operation: String = ""
    func push(_ item: String){
        items.append(item)
        for item in items{
            if item == "+" || item == "-" || item == "*" || item == "/" || item == "%" {
                operation = item
            }
            else{
                heap = Double(item)!
            }
        }
    }
    func pop(){
        items.removeLast()
    }
    
}
