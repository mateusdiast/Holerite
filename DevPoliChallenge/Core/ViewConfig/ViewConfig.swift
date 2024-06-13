//
//  ViewConfig.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 10/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation


protocol ViewConfig {
    func buildViews()
    func pin()
    func extraSetup()
    func setup()
}

extension ViewConfig {
    func setup() {
        buildViews()
        pin()
        extraSetup()
    }
}
