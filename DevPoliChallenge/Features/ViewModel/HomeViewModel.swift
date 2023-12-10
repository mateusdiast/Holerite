//
//  HomeViewModel.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func goToResult(_ salary: String, _ inss: String, _ irrf: String, _ netSalary: String, _ discounts: String, _ inssPercentege: String, _ irrfPercentege: String)
    func alertValuesInvalidate()
}

final class HomeViewModel{
    
    weak var delegate: HomeViewModelDelegate?
    
    private var inssValue: Double = 0.00
    private var inssPercentage: Double = 0
    private var irrfValue: Double = 0.00
    private var irrfPercentage: Double = 0
    private var salary: Double?
    private var netSalary: Double?
    private var discount: Double = 0.00
    
    private var inssValueString: String?
    private var inssPercentageString: String?
    private var irrfValueString: String?
    private var irrfPercentageString: String?
    private var salaryString: String?
    private var netSalaryString: String?
    private var discountString: String?
    
    
    func calculate(salary: String, discounts: String){
        
        let salaryFormatted = salary.dropFirst(2)
        guard let salaryDouble = Double(salaryFormatted.replacingOccurrences(of: ",", with: "")) else {return}
        let discountsFormatted = discounts.dropFirst(2)
        guard let discountsDouble = Double(discountsFormatted.replacingOccurrences(of: ",", with: "")) else {return}
        
        self.salary = salaryDouble
        self.discount = discountsDouble
        
        calculateINSS()
        calculateIRRF()
        calculateNetSalary()
        formattedValuesToString()
        
        if self.salary != 0 {
            delegate?.goToResult(salaryString!, inssValueString!, irrfValueString!, netSalaryString!, discountString!, inssPercentageString!, irrfPercentageString!)
         } else{
            delegate?.alertValuesInvalidate()
         }
        
        
    }
    
    private func calculateINSS(){
        switch (self.salary!) {
        case INSSModel.nivelOn:
            inssValue = 0.00
            inssPercentage = 0.0
        case INSSModel.nivelTwo:
            inssValue = (salary! / 100) * 7.5
            inssPercentage = 7.5
        case INSSModel.nivelThree:
            inssValue = (salary! / 100) * 9.0
            inssPercentage = 9.0
        case INSSModel.nivelFour:
            inssValue = (salary! / 100) * 12.0
            inssPercentage = 12.0
        default:
            inssValue = (salary! / 100) * 14.0
            inssPercentage = 14.0
        }
    }
    
    
    private func calculateIRRF(){
        switch (self.salary!) {
        case IRRFModel.nivelOn:
            irrfValue = 0.00
            irrfPercentage = 0.0
        case IRRFModel.nivelTwo:
            let deduction: Double = 142.0
            let salaryWithInss = salary! - inssValue
            let valueToCalculate: Double = (salaryWithInss / 100) * 7.5
            irrfValue = valueToCalculate - deduction
            irrfPercentage = (irrfValue / salaryWithInss) * 100

        case IRRFModel.nivelThree:
            let deduction: Double = 370.40
            let salaryWithInss = salary! - inssValue
            let valueToCalculate: Double = (salaryWithInss / 100) * 15
            irrfValue = valueToCalculate - deduction
            irrfPercentage = (irrfValue / salaryWithInss) * 100

        case IRRFModel.nivelFour:
            let deduction: Double = 651.73
            let salaryWithInss = salary! - inssValue
            let valueToCalculate: Double = (salaryWithInss / 100) * 22.5
            irrfValue = valueToCalculate - deduction
            irrfPercentage = (irrfValue / salaryWithInss) * 100
 
        default:
            let deduction: Double = 884.96
            let salaryWithInss = salary! - inssValue
            let valueToCalculate: Double = (salaryWithInss / 100) * 27.5
            irrfValue = valueToCalculate - deduction
            irrfPercentage = (irrfValue / salaryWithInss) * 100
        }
       
    }
        
    private func calculateNetSalary(){
        self.netSalary = self.salary! - (self.discount + self.inssValue + self.irrfValue)
    }
    
    func formattedValuesToString(){
        self.inssValueString = formatterValues(self.inssValue)
        self.irrfValueString = formatterValues(self.irrfValue)
        self.discountString = formatterValues(self.discount)
        self.salaryString = formatterValues(self.salary!)
        self.netSalaryString = formatterValues(self.netSalary!)
        self.inssPercentageString = String(format: "%.0f", self.inssPercentage)
        self.irrfPercentageString = String(format: "%.0f", self.irrfPercentage)
    }
    
    func formatterValues(_ value: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        return formatter.string(from: value as NSNumber)
    }
}




