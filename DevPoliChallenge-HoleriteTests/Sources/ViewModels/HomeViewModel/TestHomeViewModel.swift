//
//  TestHomeViewModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 08/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class TestHomeViewModel: XCTestCase {
    
    func test_verifyData_SalaryIsConvertedToDoubleAndIsHighThenZero_sucessfulCase(){
        let inputSalary: String = "R$ 1.324,00"
        let expectedSalary: Double = 1324
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        
        viewModel.verifyData(salary: inputSalary, discounts: "")
        
        XCTAssertEqual(viewModel.salary, expectedSalary)
    }
    
    func test_verifyData_SalaryIsFailToConvertedToDoubleAndCalledTheAlertFieldInvalidate_failCase(){
        let inputSalary: String = ""
        let expectedMessage: String = "Preencha o campo de salário!"
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: "")
        
        XCTAssertTrue(delegate.alertFieldInvalidateIsCalled)
        XCTAssertEqual(expectedMessage, delegate.messageIsCalled)
    }
    
    func test_verifyData_SalaryIsEqualToZeroAndCalledTheAlertFieldInvalidate_failCase(){
        let inputSalary: String = "R$ 0,00"
        let expectedMessage: String = "Preencha o campo de salário!"
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: "")
        
        XCTAssertTrue(delegate.alertFieldInvalidateIsCalled)
        XCTAssertEqual(expectedMessage, delegate.messageIsCalled)
    }
    
    func test_verifyData_SalaryIsNegativeAndCalledTheAlertFieldInvalidate_failCase(){
        let inputSalary: String = "R$ -345,00"
        let expectedMessage: String = "Preencha o campo de salário!"
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: "")
        
        XCTAssertTrue(delegate.alertFieldInvalidateIsCalled)
        XCTAssertEqual(expectedMessage, delegate.messageIsCalled)
    }
    
    func test_verifyData_DiscountIsNegative_outputIsZero(){
        let inputSalary: String = "R$ 1235,00"
        let inputDiscount: String = "R$ -123,00"
        let expected: Double = 0.0
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertEqual(viewModel.discount, expected)
    }
    
    func test_verifyData_DiscountIsMoreThenZeroAndLessThenSalary_outputIsvalue(){
        let inputSalary: String = "R$ 1235,00"
        let inputDiscount: String = "R$ 123,00"
        let expected: Double = 123.00
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertEqual(viewModel.discount, expected)
    }
    
    
    
    func test_verifyData_DiscountIsEqualThenSalaryAndCalledTheAlertFieldInvalidate_failCase(){
        let inputSalary: String = "R$ 123,00"
        let inputDiscount: String = "R$ 123,00"
        let expectedMessage: String = "O desconto não pode ser igual ou superior ao salário."
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertTrue(delegate.alertFieldInvalidateIsCalled)
        XCTAssertEqual(expectedMessage, delegate.messageIsCalled)
    }
    
    func test_verifyData_DiscountIsBigThenSalaryAndCalledTheAlertFieldInvalidate_failCase(){
        let inputSalary: String = "R$ 123,00"
        let inputDiscount: String = "R$ 123,44"
        let expectedMessage: String = "O desconto não pode ser igual ou superior ao salário."
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        let delegate = SpyHomeViewModelDelegate()
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertTrue(delegate.alertFieldInvalidateIsCalled)
        XCTAssertEqual(expectedMessage, delegate.messageIsCalled)

    }
    
    func test_calculateINSS_calculateINSSFromCalculatorIsCalledAndIfINSSObjectIsSetted(){
        let inputSalary: String = "R$ 1235,00"
        let inputDiscount: String = "R$ 123,00"
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertTrue(calculator.calculateINSSIsCalled)
        XCTAssertNotNil(viewModel.inss)
    }
    
    
    func test_calculateIRRF_calculateIRRFFromCalculatorIsCalledAndIfIRRFObjectIsSetted(){
        let inputSalary: String = "R$ 1235,00"
        let inputDiscount: String = "R$ 123,00"
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertTrue(calculator.calculateIRRFIsCalled)
        XCTAssertNotNil(viewModel.inss)
    }
    
    func test_calculateNetSalary_calculateNetSalaryfromCalculatorIsCalledAndIfNetSalaryValueIsSetted(){
        let inputSalary: String = "R$ 1235,00"
        let inputDiscount: String = "R$ 123,00"
        let calculator = SpyCalculator()
        let viewModel = HomeViewModel(calculator: calculator)
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertTrue(calculator.calculateIRRFIsCalled)
        XCTAssertNotNil(viewModel.netSalary)

    }
    
    
    func test_sendData_delegateGoToResultIsCalled() {
        let inputSalary: String = "R$ 1235,00"
        let inputDiscount: String = "R$ 123,00"
        let calculator = SpyCalculator()
        let delegate = SpyHomeViewModelDelegate()
        let viewModel = HomeViewModel(calculator: calculator)
        viewModel.delegate = delegate
        
        viewModel.verifyData(salary: inputSalary, discounts: inputDiscount)
        
        XCTAssertTrue(delegate.sendDataIsCalled)
    }
    
    
}
