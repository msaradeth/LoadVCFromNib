//
//  Int+Ext.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation


extension Int {
    func toMoney() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        let doubleValue = Double(self) / 100.00
        let number = NSNumber(value: doubleValue)
        let priceString = currencyFormatter.string(from: number)!
        return priceString
    }
    
}
