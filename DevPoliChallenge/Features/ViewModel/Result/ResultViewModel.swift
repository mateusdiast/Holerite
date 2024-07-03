//
//  ResultViewModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 18/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import Foundation

protocol ResultViewModelDelegate: AnyObject {
    func sendData(salary: ResultModel, discounts: ResultModel, discountINSS: ResultModel, discountIRRF: ResultModel, netSalary: ResultModel)
    
}

protocol ResultViewModelInput {
    var delegate: ResultViewModelDelegate? {get set}
    func loadResult()
}

final class ResultViewModel: ResultViewModelInput {
    weak var delegate: ResultViewModelDelegate?
    
    let salary: ResultModel
    let discount: ResultModel
    let discountInss: ResultModel
    let discountIrrf: ResultModel
    let netSalary: ResultModel
    
    init(salary: ResultModel,
         discount: ResultModel,
         discountInss: ResultModel,
         discountIrrf: ResultModel,
         netSalary: ResultModel) {
        self.salary = salary
        self.discount = discount
        self.discountInss = discountInss
        self.discountIrrf = discountIrrf
        self.netSalary = netSalary
    }
    
    func loadResult(){
        delegate?.sendData(salary: salary, discounts: discount, discountINSS: discountInss, discountIRRF: discountIrrf, netSalary: netSalary)
    }
    
}
