//
//  StockData.swift
//  StockUpdate
//
//  Created by Enoch Qu　 on 11/6/20.
//  Copyright © 2020 Xin Enoch Qu. All rights reserved.
//

import Foundation

class StockData{
    var symbol : String! = ""
    var price : Double = 0.0
    var volume : Int64 = 0
    
    init(symbol : String!, price: Double, volume: Int64) {
        self.symbol = symbol
        self.price = price
        self.volume = volume
        
    }
}
