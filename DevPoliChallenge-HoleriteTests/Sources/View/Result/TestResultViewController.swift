//
//  TestResultViewController.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 16/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import DevPoliChallenge_Holerite

final class TestResultViewController: XCTestCase {

    func test_ResultViewControllerWithResultsZeroWithStrikeThrough(){
        let vm = DummyResultViewModel()
        let view = ResultView()
        let fakeData = ResultModel(name: "Result", value: 0.0)
        view.setData(salary: fakeData, discounts: fakeData, discountINSS: fakeData, discountIRRF: fakeData, netSalary: fakeData)
        let vc = ResultViewController(resultView: view, viewModel: vm)
        
        assertSnapshot(of: vc, as: .image)
    }
    
    func test_ResultViewControllerWithResultsWithColors(){
        let vm = DummyResultViewModel()
        let view = ResultView()
        let fakeData = ResultModel(name: "Result", value: 1234.56, porcentage: 8.0)
        view.setData(salary: fakeData, discounts: fakeData, discountINSS: fakeData, discountIRRF: fakeData, netSalary: fakeData)
        let vc = ResultViewController(resultView: view, viewModel: vm)
        
        assertSnapshot(of: vc, as: .image)
    }
    

}
