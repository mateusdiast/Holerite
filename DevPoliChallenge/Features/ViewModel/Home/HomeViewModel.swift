//
//  HomeViewModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func goToResult(salary: ResultModel, discounts: ResultModel, discountINSS: ResultModel, discountIRRF: ResultModel, netSalary: ResultModel)
    func alertFieldInvalidate(message: String)
    func alertDataInvalid()
}

protocol HomeViewModelInput {
    var delegate: HomeViewModelDelegate? {get set}
    func verifyData(salary: String?, discounts: String?)
}

final class HomeViewModel: HomeViewModelInput {
    
    weak var delegate: HomeViewModelDelegate?
    
    private var inss: Tribute?
    private var irrf: Tribute?
    private var netSalary: Double = 0.0
    private var salary: Double = 0.0
    private var discount: Double = 0.0
    private var calculator: CalculatorInput
    
    
    init(calculator: CalculatorInput) {
        self.calculator = calculator
    }
    
    func verifyData(salary: String?, discounts: String?) {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        guard let salaryDouble = numberFormatter.number(from: salary ?? "" ) as? Double  else {
            delegate?.alertFieldInvalidate(message: "Preencha o campo de salário!")
            return
        }
        
        if let discountDouble = numberFormatter.number(from: discounts ?? "" ) as? Double {
            discount = discountDouble
        }
        
        if salaryDouble <= 0.0  {
            delegate?.alertFieldInvalidate(message: "Preencha o campo de salário!")
        } else if discount >= salaryDouble {
            delegate?.alertFieldInvalidate(message: "O desconto não pode ser igual ou superior ao salário.")
            return
        }
        self.salary = salaryDouble
        calculate()
    }
}

// MARK: FORMAT VALUES

extension HomeViewModel {
    
    private func sendData() {
        let salary = ResultModel(name: "Salário Bruto", value: salary, porcentage: nil)
        let discount = ResultModel(name: "Descontos", value: discount, porcentage: nil)
        let discountInss = ResultModel(name: "Desconto INSS", value: inss?.value ?? 0.0, porcentage: inss?.percentage ?? 0.0)
        let discountIrrf = ResultModel(name: "Desconto IRRF", value: irrf?.value ?? 0.0, porcentage: irrf?.percentage ?? 0.0)
        let netSalary  = ResultModel(name: "Salário líquido", value: netSalary, porcentage: nil)
        delegate?.goToResult(
            salary: salary,
            discounts: discount,
            discountINSS: discountInss,
            discountIRRF: discountIrrf,
            netSalary: netSalary
        )
    }
}

// MARK: CALCULATE

extension HomeViewModel {
    
    private func calculate(){
        calculateINSS()
        calculateIRRF()
        calculateNetSalary()
        sendData()
    }
    
    private func calculateINSS() {
        let result = calculator.calculateINSS(value: salary)
        inss = result
    }
    
    private func calculateIRRF() {
        let result = calculator.calculateIRRF(value: salary, discount: discount)
        irrf = result
    }
    
    private func calculateNetSalary() {
        let result = calculator.calculateNetSalary(value: salary, discount: discount)
        netSalary = result
    }
}






