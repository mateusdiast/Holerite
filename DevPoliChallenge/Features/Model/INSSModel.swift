//
//  INSSModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 14/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

struct INSSModel: Tribute {
    var value: Double?
    var percentage: Double?
    var deduction: Double?

    mutating func getData(salary: Double) {
        if salary < 0 {
            percentage = 0.0
            return
        }
        switch salary {
        case 0.0...1411.99:
            percentage = 0.0
        case 1412.00:
            percentage = 7.5
            deduction = 0.0
        case 1412.01...2666.68:
            percentage = 9.0
            deduction = 21.18
        case 2666.69...4000.03:
            percentage = 12.0
            deduction = 101.18
        case 4000.04...7786.02:
            percentage = 14
            deduction = 181.18
        default:
            percentage = 14.0
            deduction = 0.0
        }
    }
}
