//
//  TestHomeViewController.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 16/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import DevPoliChallenge_Holerite

final class TestHomeViewController: XCTestCase {
    
    func test_HomeViewControllerWithFieldsWithoutTexts(){
        let vm = SpyHomeViewModel()
        let view = HomeView()
        let vc = HomeViewController(view: view, viewModel: vm)
        
        assertSnapshot(of: vc, as: .image)
    }

}
