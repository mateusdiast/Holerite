//
//  TestResultViewModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 07/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import XCTest
@testable import DevPoliChallenge_Holerite

final class TestResultViewModel: XCTestCase {
    
    func test_loadResultIsCalled(){
        let mockDatas = ResultModel(name: "", value: 0.0, porcentage: 0.0)
        let resultViewModel = ResultViewModel(salary: mockDatas, discount: mockDatas, discountInss: mockDatas, discountIrrf: mockDatas, netSalary: mockDatas)
        let delegate = SpyResultViewModelDelegate()
        resultViewModel.delegate = delegate
        
        resultViewModel.loadResult()
        
        XCTAssertTrue(delegate.sendDataIsCalled)
    }
    
}
