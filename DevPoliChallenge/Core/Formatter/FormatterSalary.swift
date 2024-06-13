//
//  FormatterSalary.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 12/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

final class FormatterSalary: Formatter {

    var amount: Int = 0

    func format(value: String) -> Double {
        let digit = Int(value)
        if value == "" {
            amount = amount/10
            return Double(amount/100) + Double(amount%100) / 100

        }
        amount = amount * 10 + (digit ?? 0)
        return  Double(amount/100) + Double(amount%100) / 100
    }
    
    
}
