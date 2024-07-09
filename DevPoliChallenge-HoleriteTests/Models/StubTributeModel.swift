//
//  StubINSSModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 06/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge_Holerite

struct StubTributeModel: Tribute {
    var value: Double?
    var percentage: Double?
    var deduction: Double?
    
    mutating func setData(salary: Double) {}

}
