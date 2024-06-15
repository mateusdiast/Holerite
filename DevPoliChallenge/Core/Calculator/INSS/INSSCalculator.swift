//
//  INSSCalculator.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 14/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation


final class INSSCalculator: Calculator {
    
    private var inss: Tribute
    
    init(inss: Tribute) {
        self.inss = inss
    }
    
    func calculate(value: Double) -> Any {
        switch (value){
        case INSSCase.nivelOn:
            inss.value = 0.00
            inss.percentage = 0.0
        case INSSCase.nivelTwo:
            inss.value = (value / 100) * 7.5
            inss.percentage  = 7.5
        case INSSCase.nivelThree:
            inss.value = (value / 100) * 9.0
            inss.percentage  = 9.0
        case INSSCase.nivelFour:
            inss.value = (value / 100) * 12.0
            inss.percentage  = 12.0
        default:
            inss.value = (value / 100) * 14.0
            inss.percentage  = 14.0
        }
        
        return inss
        
    }
    
}
