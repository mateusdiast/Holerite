//
//  FormatterData.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 12/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

protocol Formatter {
    var amount: Int {get set}
    func format(value: String) -> Double
}
