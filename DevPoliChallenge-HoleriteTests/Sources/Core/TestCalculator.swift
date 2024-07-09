//
//  TestCalculator.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 06/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class TestCalculator: XCTestCase {
    
    
    func test_calculateINSS_inputValue_outputValue() {
        let input = 1673.28
        let expectedPercentage = 12.0
        let expectedValue = 179.61360000000002
        var inssModel = StubTributeModel()
        inssModel.percentage =  12.0
        inssModel.deduction = 21.18
        let calculator = Calculator(irrf: inssModel, inss: inssModel)
      
        let result = calculator.calculateINSS(value: input)
        
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.value, expectedValue)
    }
    
    func test_calculateINSS_inputMaxValue_outputValue() {
        let input = 7786.03
        let expectedPercentage = 21.0
        let expectedValue = 908.86
        var inssModel = StubTributeModel()
        inssModel.percentage =  21.0
        inssModel.deduction = 0.0
        let calculator = Calculator(irrf: inssModel, inss: inssModel)
      
        let result = calculator.calculateINSS(value: input)
        
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.value, expectedValue)
    }
    
    func test_calculateIRRF_inputValueWithoutDiscount_outputValueZero() {
        let input = 2259.20
        let expectedPercentage = 7.5
        let expectedValue =  94.87275
        var inssModel = StubTributeModel()
        inssModel.value = 123.43
        var irrfModel = StubTributeModel()
        irrfModel.percentage = 7.5
        irrfModel.deduction = 65.31
        let calculator = Calculator(irrf: irrfModel, inss: inssModel)
        
        let result = calculator.calculateIRRF(value: input, discount: 0.0)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.value, expectedValue)
    }
    
    
    
    func test_calculateNetSalary_inputValueWithDiscount_outputValueWithINSSAndIRRF(){
        let input = 3456.34
        let discountInput = 213.56
        let expectedValue = 3242.78
        let tribute = StubTributeModel()
        let calculator = Calculator(irrf: tribute, inss: tribute)
        
        let result = calculator.calculateNetSalary(value: input, discount: discountInput)
        
        XCTAssertEqual(result, expectedValue)
    }
    
    
}
