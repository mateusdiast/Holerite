//
//  struct.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 14/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

struct IRRFModel: Tribute {
    var value: Double?
    var percentage: Double?
    var deduction: Double?
    
    mutating func getData(salary: Double) {
        if salary < 0 {
            percentage = 0.0
            return
        }
        switch salary{
        case 0...2259.20:
            percentage = 0.0
        case 2259.21...2826.65:
            percentage = 7.5
            deduction = 169.44
        case 2826.66...3751.05:
            percentage = 15
            deduction = 381.44
        case 3751.06...4664.68:
            percentage = 22.5
            deduction = 662.77
        default:
            percentage = 27.5
            deduction = 896.00
        }
    }
}
