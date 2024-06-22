//
//  CustomTextField.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 10/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation
import UIKit

final class CustomTextField: UITextField {
    
    private var placeHolderText: String
    
    init(placeHolder: String) {
        placeHolderText = placeHolder
        super.init(frame: .zero)
        viewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomTextField {
    
    private func viewConfig() {
        placeholder = placeHolderText
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor =  DesignSystem.Colors.borderColor.cgColor
        keyboardType = .numberPad
        translatesAutoresizingMaskIntoConstraints = false
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: self.frame.height))
        leftViewMode = .always
    }
    
}

