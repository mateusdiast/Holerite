//
//  TestIRRFModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 05/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class TestIRRFModel: XCTestCase {
    
    func test_getData_inputNegativeValue_OutputZeroPercentage(){
        let input: Double = -1.0
        let expected: Double = 0
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expected)
    }
    
    func test_getData_rangeOne_inputMinValue_OutputValue(){
        let input: Double = 0.0
        let expected: Double = 0
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expected)
    }

    func test_getData_rangeOne_inputMediumValue_OutputValue(){
        let input: Double = 1129.60
        let expected: Double = 0
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expected)
    }
    
    func test_getData_rangeOne_inputMaxValue_OutputValue(){
        let input: Double = 2259.20
        let expected: Double = 0
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expected)
    }
    
    func test_getData_rangeTwo_inputMinValue_OutputValue(){
        let input: Double = 2259.21
        let expectedPercentage: Double = 7.5
        let expectedDeduction: Double = 169.44
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeTwo_inputMediumValue_OutputValue(){
        let input: Double = 2541.93
        let expectedPercentage: Double = 7.5
        let expectedDeduction: Double = 169.44
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeTwo_inputMaxValue_OutputValue(){
        let input: Double = 2826.65
        let expectedPercentage: Double = 7.5
        let expectedDeduction: Double = 169.44
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeThree_inputMinValue_OutputValue(){
        let input: Double = 2826.66
        let expectedPercentage: Double = 15.0
        let expectedDeduction: Double = 381.44
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeThree_inputMediumValue_OutputValue(){
        let input: Double = 3288.85
        let expectedPercentage: Double = 15.0
        let expectedDeduction: Double = 381.44
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeThree_inputMaxValue_OutputValue(){
        let input: Double = 3751.05
        let expectedPercentage: Double = 15.0
        let expectedDeduction: Double = 381.44
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFour_inputMinValue_OutputValue(){
        let input: Double = 3751.06
        let expectedPercentage: Double = 22.5
        let expectedDeduction: Double = 662.77
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFour_inputMediumValue_OutputValue(){
        let input: Double = 4207.87
        let expectedPercentage: Double = 22.5
        let expectedDeduction: Double = 662.77
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFour_inputMaxValue_OutputValue(){
        let input: Double = 4664.68
        let expectedPercentage: Double = 22.5
        let expectedDeduction: Double = 662.77
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeMax_inputValue_OutputValue(){
        let input: Double = 4664.69
        let expectedPercentage: Double = 27.5
        let expectedDeduction: Double = 896.00
        var result = IRRFModel()
        
        result.getData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
}
