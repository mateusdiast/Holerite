//
//  SpyHomeViewModelDelegate.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 09/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

import Foundation
@testable import DevPoliChallenge_Holerite

final class SpyHomeViewModelDelegate: HomeViewModelDelegate {
   
    private(set) var alertFieldInvalidateIsCalled: Bool = false
    private(set) var sendDataIsCalled: Bool = false
    
    func goToResult(salary: DevPoliChallenge_Holerite.ResultModel, discounts: DevPoliChallenge_Holerite.ResultModel, discountINSS: DevPoliChallenge_Holerite.ResultModel, discountIRRF: DevPoliChallenge_Holerite.ResultModel, netSalary: DevPoliChallenge_Holerite.ResultModel) {
        sendDataIsCalled = true
    }
    
    func alertFieldInvalidate(message: String) {
        alertFieldInvalidateIsCalled = true
    }
    
    func alertDataInvalid() {
        
    }
    
    
}
