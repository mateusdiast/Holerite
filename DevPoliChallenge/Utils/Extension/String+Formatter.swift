//
//  FormatterString+.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 27/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

extension String {
    
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let amountWithPrefix = self
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        let amountWithoutPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        let doubleValue = (amountWithoutPrefix as NSString).doubleValue
     
        number = NSNumber(value: (doubleValue / 100))
        
        guard number != 0 as NSNumber else {
            return ""
        }
        return formatter.string(from: number)!
    }
    
    func currencyFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let amountWithPrefix = self
        let doubleValue = (amountWithPrefix as NSString).doubleValue
        
        number = NSNumber(value: doubleValue)
        
        return formatter.string(from: number)!
    }
    
}
