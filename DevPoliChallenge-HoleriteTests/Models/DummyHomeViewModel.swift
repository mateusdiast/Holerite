//
//  SpyHomeViewModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 09/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge_Holerite

final class DummyHomeViewModel: HomeViewModelInput {
    
    var delegate: DevPoliChallenge_Holerite.HomeViewModelDelegate?
    
    func verifyData(salary: String?, discounts: String?) {}
    
    
}
