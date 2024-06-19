//
//  HomeViewModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func goToResult(values: [String])
    func alertFieldEmpty()
    func sendDataSalaryField(value: Double)
    func sendDataDiscountsField(value: Double)
    func alertDataInvalid()
}


final class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    private var formatterSalary: Formatter
    private var formatterDiscount: Formatter
    private var inssCalculator: Calculator
    private var irrfCalculator: Calculator
    private var salaryCalculator: Calculator
    private var inss: Tribute?
    private var irrf: Tribute?
    private var netSalary: Double = 0.0
    private var salary: Double = 0.0
    private var discount: Double = 0.0
    private var values: [String] = []
    
    
    
    init(formatterSalary: Formatter,
         formatterDiscount: Formatter,
         inssCalculator: Calculator,
         irrfCalculator: Calculator,
         salaryCalculator: Calculator,
         delegate: HomeViewModelDelegate) {
        self.formatterSalary = formatterSalary
        self.formatterDiscount = formatterDiscount
        self.inssCalculator = inssCalculator
        self.irrfCalculator = irrfCalculator
        self.salaryCalculator = salaryCalculator
        self.delegate = delegate
    }
    
    func verifyData(salary: String, discounts: String) {
        let salaryFormatted = salary.dropFirst(2)
        guard let salaryDouble = Double(salaryFormatted.replacingOccurrences(of: ",", with: "")) else {
            delegate?.alertFieldEmpty()
            return
        }
        let discountsFormatted = discounts.dropFirst(2)
        if let discountDouble = Double(discountsFormatted.replacingOccurrences(of: ",", with: "")) {
            discount = discountDouble
        }
        
        if salaryDouble <= 0.0 {
            delegate?.alertFieldEmpty()
            return
        }
        self.salary = salaryDouble
        calculate()
    }
}

// MARK: FORMAT VALUES

extension HomeViewModel {
    
    private func convertToString() {
        values.removeAll()
        values.append(formatToNumberStyle(inss?.value ?? 0.0))
        values.append(formatToNumberStyle(irrf?.value ?? 0.0))
        values.append(formatToNumberStyle(discount))
        values.append(formatToNumberStyle(salary))
        values.append(formatToNumberStyle(netSalary))
        values.append(String(format: "%.0f", inss?.percentage ?? 0.0))
        values.append(String(format: "%.0f", irrf?.percentage ?? 0.0))
    }
    
    private func formatToNumberStyle(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        return formatter.string(from: value as NSNumber)!
    }
}

// MARK: CALCULATE

extension HomeViewModel {
    
    private func calculate(){
        calculateINSS()
        calculateIRRF()
        calculateNetSalary()
        convertToString()
        delegate?.goToResult(values: values)
    }
    
    private func calculateINSS() {
        let result = inssCalculator.calculate(value: salary)
        inss = result as? Tribute
    }
    
    private func calculateIRRF() {
        let irrfInput = irrfCalculator as? InputIRRFValue
        if let inss = inss {
            irrfInput?.setINSSValue(inssValue: inss)
        }
        let irrfCalculate = irrfInput as? Calculator
        let irrfResult = irrfCalculate?.calculate(value: salary)
        irrf = irrfResult as? Tribute
    }
    
    private func calculateNetSalary() {
        let salaryInput = salaryCalculator as? InputSalaryValue
        salaryInput?.setValues(discount: discount, inss: inss, irrf: irrf)
        let salaryCalculate = salaryInput as? Calculator
        if let result = salaryCalculate?.calculate(value: salary) as? Double {
            netSalary = result
        }
    }
}

// MARK: FORMAT TEXTFIELD

extension HomeViewModel {
    
    func validadeDataTyped(value: String, key: Int) {
        let valueTapped = value.range(of: NumberRegex.numberValue, options: .regularExpression)
        
        if valueTapped != nil {
            formatValues(value: value, key: key)
            return
        }
        
        delegate?.alertDataInvalid()
    }
    
    private func formatValues(value: String, key: Int) {
        
        let keyCases = KeyTextField(rawValue: key)

        switch keyCases {
        case .salary:
            let resultValue = formatterSalary.format(value: value)
            delegate?.sendDataSalaryField(value: resultValue)
        case .discounts:
            let resultValue = formatterDiscount.format(value: value)
            delegate?.sendDataDiscountsField(value: resultValue)
            
        default:
            return
        }
        
    }
}




