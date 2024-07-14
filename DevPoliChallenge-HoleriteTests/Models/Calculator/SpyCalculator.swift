//
//  SpyCalculator.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 09/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class SpyCalculator: CalculatorInput {
    
    private(set) var calculateINSSIsCalled: Bool = false
    private(set) var calculateIRRFIsCalled: Bool = false
    private(set) var calculateNetSalaryIsCalled: Bool = false
    private var tribute = StubTributeModel()

    
    func calculateINSS(value: Double) -> DevPoliChallenge_Holerite.Tribute {
        calculateINSSIsCalled = true
        return tribute
    }
    
    func calculateIRRF(value: Double, discount: Double) -> DevPoliChallenge_Holerite.Tribute {
        calculateIRRFIsCalled = true
        return tribute
    }
    
    func calculateNetSalary(value: Double, discount: Double) -> Double {
        calculateNetSalaryIsCalled = true
        return 0.0
    }
    
    
}
