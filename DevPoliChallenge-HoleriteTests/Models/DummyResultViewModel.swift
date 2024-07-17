//
//  DummyResultViewModel.swift
//  DevPoliChallenge-HoleriteTests
//
//  Created by Mateus Dias on 16/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
@testable import DevPoliChallenge_Holerite

final class DummyResultViewModel: ResultViewModelInput {
    var delegate: DevPoliChallenge_Holerite.ResultViewModelDelegate?
    
    func loadResult() {}
}
