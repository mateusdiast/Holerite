//
//  Label+Style.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 02/07/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setStyleTextLabel(value: String, color: UIColor) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let dataDouble = formatter.number(from: value)
        if dataDouble == 0.0 {
            self.textColor = DesignSystem.Colors.secondary
            self.attributedText = self.text?.strikeThrough()
            return
        }
        self.textColor = color
    }
    
}
