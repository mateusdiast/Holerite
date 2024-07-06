//
//  DevPoliChallenge_HoleriteTests.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 03/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import XCTest
@testable import DevPoliChallenge_Holerite

final class StringFormatterTests: XCTestCase {
    
    func test_currencyInputFormatting_inputZero_outputEmpty(){
        let input: String = "0"
        let expected: String = ""
        
        let result = input.currencyInputFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    func test_currencyInputFormatting_inputNegativeValue_outputPositiveNumber(){
        let input: String = "-146"
        let expected: String = "R$ 1,46"
        
        let result = input.currencyInputFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    func test_currencyInputFormatting_inputValue_outputValueFormatted() {
        let input: String = "1956"
        let expected: String = "R$ 19,56"
        
        let result = input.currencyInputFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    func test_currencyInputFormatting_inputValue_outputValueFormattedWithMilhar() {
        let input: String = "195432"
        let expected: String = "R$ 1.954,32"
        
        let result = input.currencyInputFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    //MARK: func currencyFormatting
    
    func test_currencyFormatting_inputZero_OutputZeroFormatted(){
        let input: String = "0"
        let expected: String = "R$ 0,00"
        
        let result = input.currencyFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    func test_currencyFormatting_inputNegativeValue_OutputNegativeValueFormatted(){
        let input: String = "-1324"
        let expected: String = "-R$ 1.324,00"
        
        let result = input.currencyFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    func test_currencyFormatting_inputValue_OutputValueWithMilharFormatted(){
        let input: String = "1324"
        let expected: String = "R$ 1.324,00"
        
        let result = input.currencyFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    func test_currencyFormatting_inputValue_OutputValueWithoutMilharFormatted(){
        let input: String = "132"
        let expected: String = "R$ 132,00"
        
        let result = input.currencyFormatting()
        
        XCTAssertEqual(result, expected)
    }
    
    
    
}
