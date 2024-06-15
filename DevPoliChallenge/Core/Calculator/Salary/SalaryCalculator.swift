//
//  SalaryCalculator.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 14/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation


final class SalaryCalculator: Calculator, InputSalaryValue {
    
    
    private var discount: Double = 0.0
    private var inssValue: Double = 0.0
    private var irrfValue: Double = 0.0
    
    func calculate(value: Double) -> Any {
        return value - (discount + inssValue + irrfValue)
    }
    
    func setValues(discount: Double, inss: Tribute?, irrf: Tribute?) {
        self.discount = discount
        self.inssValue = inss?.value ?? 0
        self.irrfValue = irrf?.value ?? 0
        
    }
    
}

