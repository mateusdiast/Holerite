//
//  ResultViewModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 18/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

protocol ResultViewModelDelegate: AnyObject {
    func configValueEqualZero(view: Any)
    func configValueDifferentZero(view: Any)
    
}

protocol ResultViewModelInput {
    var delegate: ResultViewModelDelegate? {get set}
    func verifyData(data: String, view: Any)
}

final class ResultViewModel: ResultViewModelInput {
    weak var delegate: ResultViewModelDelegate?
    
    func verifyData(data: String, view: Any) {
        
        if data == "R$0.00" {
            delegate?.configValueEqualZero(view: view)
            return
        }
        delegate?.configValueDifferentZero(view: view)
        
    }
}
