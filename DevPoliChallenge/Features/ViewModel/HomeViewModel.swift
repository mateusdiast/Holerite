//
//  HomeViewModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func goToResult(_ salary: String, _ inss: String, _ irrf: String, _ netSalary: String, _ discount: String, _ inssPercentage: String, _ irrfPercentage: String)
    func alertValuesInvalidate()
}

final class HomeViewModel{
    
    weak var delegate: HomeViewModelDelegate?
    
    private var resultDoubleModel = ResultDoubleModel()
    private var resultStringModel = ResultStringModel()
    
    
    func calculate(salary: String, discounts: String){
        
        
        let salaryFormatted = salary.dropFirst(2)
        guard let salaryDouble = Double(salaryFormatted.replacingOccurrences(of: ",", with: "")) else {return}
        let discountsFormatted = discounts.dropFirst(2)
        guard let discountsDouble = Double(discountsFormatted.replacingOccurrences(of: ",", with: "")) else {return}
        
        resultDoubleModel.salary = salaryDouble
        resultDoubleModel.discount = discountsDouble
        
        calculateINSS()
        calculateIRRF()
        calculateNetSalary()
        formattedValuesToString()
        
        if resultDoubleModel.salary != 0 {
            delegate?.goToResult(resultStringModel.salary, resultStringModel.inssValue, resultStringModel.irrfValue, resultStringModel.netSalary, resultStringModel.discount, resultStringModel.inssPercentage, resultStringModel.irrfPercentage)
         } else{
            delegate?.alertValuesInvalidate()
         }
        
        
    }
    
    private func calculateINSS(){
        switch (resultDoubleModel.salary) {
        case INSSModel.nivelOn:
            resultDoubleModel.inssValue = 0.00
            resultDoubleModel.inssPercentage = 0.0
        case INSSModel.nivelTwo:
            resultDoubleModel.inssValue = (resultDoubleModel.salary / 100) * 7.5
            resultDoubleModel.inssPercentage = 7.5
        case INSSModel.nivelThree:
            resultDoubleModel.inssValue = (resultDoubleModel.salary / 100) * 9.0
            resultDoubleModel.inssPercentage = 9.0
        case INSSModel.nivelFour:
            resultDoubleModel.inssValue = (resultDoubleModel.salary / 100) * 12.0
            resultDoubleModel.inssPercentage = 12.0
        default:
            resultDoubleModel.inssValue = (resultDoubleModel.salary / 100) * 14.0
            resultDoubleModel.inssPercentage = 14.0
        }
    }
    
    
    private func calculateIRRF(){
        switch (resultDoubleModel.salary) {
        case IRRFModel.nivelOn:
            resultDoubleModel.irrfValue = 0.00
            resultDoubleModel.irrfPercentage = 0.0
        case IRRFModel.nivelTwo:
            resultDoubleModel.deduction = 142.0
            resultDoubleModel.salaryWithInss = resultDoubleModel.salary - resultDoubleModel.inssValue
            resultDoubleModel.valueToCalculate = (resultDoubleModel.salaryWithInss / 100) * 7.5
            resultDoubleModel.irrfValue = resultDoubleModel.valueToCalculate - resultDoubleModel.deduction
            resultDoubleModel.irrfPercentage = (resultDoubleModel.irrfValue / resultDoubleModel.salaryWithInss) * 100

        case IRRFModel.nivelThree:
            resultDoubleModel.deduction = 370.40
            resultDoubleModel.salaryWithInss = resultDoubleModel.salary - resultDoubleModel.inssValue
            resultDoubleModel.valueToCalculate = (resultDoubleModel.salaryWithInss / 100) * 15
            resultDoubleModel.irrfValue = resultDoubleModel.valueToCalculate - resultDoubleModel.deduction
            resultDoubleModel.irrfPercentage = (resultDoubleModel.irrfValue / resultDoubleModel.salaryWithInss) * 100

        case IRRFModel.nivelFour:
            resultDoubleModel.deduction = 651.73
            resultDoubleModel.salaryWithInss = resultDoubleModel.salary - resultDoubleModel.inssValue
            resultDoubleModel.valueToCalculate = (resultDoubleModel.salaryWithInss / 100) * 22.5
            resultDoubleModel.irrfValue = resultDoubleModel.valueToCalculate - resultDoubleModel.deduction
            resultDoubleModel.irrfPercentage = (resultDoubleModel.irrfValue / resultDoubleModel.salaryWithInss) * 100
        default:
            resultDoubleModel.deduction = 884.96
            resultDoubleModel.salaryWithInss = resultDoubleModel.salary - resultDoubleModel.inssValue
            resultDoubleModel.valueToCalculate = (resultDoubleModel.salaryWithInss / 100) * 27.5
            resultDoubleModel.irrfValue = resultDoubleModel.valueToCalculate - resultDoubleModel.deduction
            resultDoubleModel.irrfPercentage = (resultDoubleModel.irrfValue / resultDoubleModel.salaryWithInss) * 100
        }
       
    }
        
    private func calculateNetSalary(){
        resultDoubleModel.netSalary = resultDoubleModel.salary - (resultDoubleModel.discount + resultDoubleModel.inssValue + resultDoubleModel.irrfValue)
    }
    
    func formattedValuesToString(){
        resultStringModel.inssValue = formatterValues(resultDoubleModel.inssValue)
        resultStringModel.irrfValue = formatterValues(resultDoubleModel.irrfValue)
        resultStringModel.discount = formatterValues(resultDoubleModel.discount)
        resultStringModel.salary = formatterValues(resultDoubleModel.salary)
        resultStringModel.netSalary = formatterValues(resultDoubleModel.netSalary)
        resultStringModel.inssPercentage = String(format: "%.0f", resultDoubleModel.inssPercentage)
        resultStringModel.irrfPercentage = String(format: "%.0f", resultDoubleModel.irrfPercentage)
    }
    
    func formatterValues(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        return formatter.string(from: value as NSNumber)!
    }
}




