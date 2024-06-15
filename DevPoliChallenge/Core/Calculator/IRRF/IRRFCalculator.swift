//
//  IRRFCalculator.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 14/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation


final class IRRFCalculator: Calculator, InputIRRFValue {
    
    private var irrf: Tribute
    private var inssValue: Double = 0.0
    
    init(irrf: Tribute) {
        self.irrf = irrf
    }
    
    func calculate(value: Double) -> Any {
        
        var deduction: Double = 0.0
        var valueWithoutInss: Double = 0.0
        
        switch (value) {
        case IRRFCase.nivelOn:
            irrf.value = 0.0
            irrf.percentage = 0.0
        case IRRFCase.nivelTwo:
            deduction = 142.0
            valueWithoutInss =  value - inssValue
            irrf.value = ((valueWithoutInss / 100) * 7.5) - deduction
            irrf.percentage = ((irrf.value ?? 0 ) / valueWithoutInss) * 100
        case IRRFCase.nivelThree:
            deduction = 370.40
            valueWithoutInss =  value - inssValue
            irrf.value = ((valueWithoutInss / 100) * 15) - deduction
            irrf.percentage = ((irrf.value ?? 0 ) / valueWithoutInss) * 100
        case IRRFCase.nivelFour:
            deduction = 651.73
            valueWithoutInss =  value - inssValue
            irrf.value = ((valueWithoutInss / 100) * 22.5) - deduction
            irrf.percentage = ((irrf.value ?? 0) / valueWithoutInss) * 100
        default:
            deduction = 884.96
            valueWithoutInss =  value - inssValue
            irrf.value = ((valueWithoutInss / 100) * 27.5) - deduction
            irrf.percentage = ((irrf.value ?? 0) / valueWithoutInss) * 100
        }
        
        return irrf
    }
    
    func setINSSValue(inssValue: Tribute) {
        self.inssValue = inssValue.value ?? 0.0
    }
}
