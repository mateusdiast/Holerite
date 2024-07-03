//
//  Calculatorr.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 29/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

protocol CalculatorInput {
    func calculateINSS(value: Double) -> Tribute
    func calculateIRRF(value: Double, discount: Double) -> Tribute
    func calculateNetSalary(value: Double, discount: Double) -> Double
}

final class Calculator: CalculatorInput {
    
    private var irrf: Tribute
    private var inss: Tribute
    
    init(irrf: Tribute, inss: Tribute) {
        self.irrf = irrf
        self.inss = inss
    }
    
    func calculateINSS(value: Double) -> Tribute {
        inss.getData(salary: value)
        inss.value = ((value / 100) * (inss.percentage ?? 0)) - (inss.deduction ?? 0.0)
        if (inss.value ?? 0.0) > 908.86 {
            inss.value = 908.86
        }
        return inss
    }
    
    func calculateIRRF(value: Double, discount: Double) -> Tribute {
        let salaryWithDiscounts = value - (inss.value ?? 0.0) - discount
        irrf.getData(salary: salaryWithDiscounts)
        irrf.value = ((salaryWithDiscounts / 100) * (irrf.percentage ?? 0.0)) - (irrf.deduction ?? 0.0)
        return irrf
    }
    
    func calculateNetSalary(value: Double, discount: Double) -> Double {
        return value - (discount + (inss.value ?? 0.0) + (irrf.value ?? 0.0))
    }
    
    
}
