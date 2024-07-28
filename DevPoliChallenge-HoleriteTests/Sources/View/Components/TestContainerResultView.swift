//
//  TestContainerResultView.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 26/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import DevPoliChallenge_Holerite

final class TestContainerResultView: XCTestCase {
    
    func test_containerResultViewWithPercentageLabelSetted(){
    
        let containerResultView = ContainerResultView(color: .green)
        containerResultView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let inputTitle = "TestResult"
        let inputValue = "324523"
        let inputPercentage = "9.8%"
        
        containerResultView.setData(title: inputTitle, value: inputValue, percentage: inputPercentage)
        containerResultView.setupPercetage()
        
        assertSnapshot(of: containerResultView, as: .image)
        
    }
    
    func test_containerResultViewWithoutPercentageLabel(){
        let containerResultView = ContainerResultView(color: .green)
        containerResultView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let inputTitle = "TestResult"
        let inputValue = "324523"
        let inputPercentage = ""
        
        containerResultView.setData(title: inputTitle, value: inputValue, percentage: inputPercentage)
        
        assertSnapshot(of: containerResultView, as: .image)
    }
    
}
