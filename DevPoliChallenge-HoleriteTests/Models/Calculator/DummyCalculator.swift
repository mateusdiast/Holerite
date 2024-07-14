//
//  StubCalculator.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 08/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class DummyCalculator: CalculatorInput {
    
    var tribute: Tribute = StubTributeModel()
    
    func calculateINSS(value: Double) -> DevPoliChallenge_Holerite.Tribute {
        return tribute
    }
    
    func calculateIRRF(value: Double, discount: Double) -> DevPoliChallenge_Holerite.Tribute {
        return tribute
    }
    
    func calculateNetSalary(value: Double, discount: Double) -> Double {
        return 0.0
    }
    
    
}
