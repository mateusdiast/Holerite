//
//  SpyResultViewModelDelegate.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 07/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge_Holerite

final class SpyResultViewModelDelegate: ResultViewModelDelegate {
    
    private(set) var sendDataIsCalled: Bool = false

    func sendData(salary: DevPoliChallenge_Holerite.ResultModel, discounts: DevPoliChallenge_Holerite.ResultModel, discountINSS: DevPoliChallenge_Holerite.ResultModel, discountIRRF: DevPoliChallenge_Holerite.ResultModel, netSalary: DevPoliChallenge_Holerite.ResultModel) {
        sendDataIsCalled = true
    }
    
}
