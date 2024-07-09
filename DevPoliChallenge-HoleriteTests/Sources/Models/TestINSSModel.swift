//
//  TestINSSModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 05/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class TestINSSModel: XCTestCase {
    
    func test_getData_inputNegativeValue_OutputZeroPercentage() {
        let input: Double = -1.0
        let expectedPercentage: Double = 0.0
        let expectedDeduction: Double = 0.0
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeOne_inputMinValue_OutputValue(){
        let input: Double = 0.0
        let expectedPercentage: Double = 0.0
        let expectedDeduction: Double = 0.0
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeOne_inputMediumValue_OutputValue(){
        let input: Double = 705.99
        let expectedPercentage: Double = 0.0
        let expectedDeduction: Double = 0.0
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeOne_inputMaxValue_OutputValue(){
        let input: Double = 1411.99
        let expectedPercentage: Double = 0.0
        let expectedDeduction: Double = 0.0
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeTwo_inputValue_OutputValue(){
        let input: Double = 1412.00
        let expectedPercentage: Double = 7.5
        let expectedDeduction: Double = 0.0
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeThree_inputMinValue_OutputValue(){
        let input: Double = 1412.01
        let expectedPercentage: Double = 9.0
        let expectedDeduction: Double = 21.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeThree_inputMediumValue_OutputValue(){
        let input: Double = 2039.34
        let expectedPercentage: Double = 9.0
        let expectedDeduction: Double = 21.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeThree_inputMaxValue_OutputValue(){
        let input: Double = 2666.68
        let expectedPercentage: Double = 9.0
        let expectedDeduction: Double = 21.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFour_inputMinValue_OutputValue(){
        let input: Double = 2666.69
        let expectedPercentage: Double = 12.0
        let expectedDeduction: Double = 101.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFour_inputMediumValue_OutputValue(){
        let input: Double = 3333.36
        let expectedPercentage: Double = 12.0
        let expectedDeduction: Double = 101.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFour_inputMaxValue_OutputValue(){
        let input: Double = 4000.03
        let expectedPercentage: Double = 12.0
        let expectedDeduction: Double = 101.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFive_inputMinValue_OutputValue(){
        let input: Double = 4000.04
        let expectedPercentage: Double = 14.0
        let expectedDeduction: Double = 181.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFive_inputMediumValue_OutputValue(){
        let input: Double = 5893.03
        let expectedPercentage: Double = 14.0
        let expectedDeduction: Double = 181.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeFive_inputMaxValue_OutputValue(){
        let input: Double = 7786.02
        let expectedPercentage: Double = 14.0
        let expectedDeduction: Double = 181.18
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
    func test_getData_rangeMax_inputValue_OutputValue(){
        let input: Double = 7786.03
        let expectedPercentage: Double = 14.0
        let expectedDeduction: Double = 0.0
        var result = INSSModel()
        
        result.setData(salary: input)
        
        XCTAssertEqual(result.percentage, expectedPercentage)
        XCTAssertEqual(result.deduction, expectedDeduction)
    }
    
}
