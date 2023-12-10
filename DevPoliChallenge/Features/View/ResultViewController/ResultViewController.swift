//
//  SecondViewController.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultView = ResultView()
    var salary: String?
    var discounts: String?
    var inss: String?
    var irrf: String?
    var netSalary: String?
    var inssPercentege: String?
    var irrfPercentege: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
        resultView.viewGrossSalary.setValue(salary!)
        resultView.viewDiscounts.setValueDiscounts(discounts!)
        resultView.viewINSSDiscounts.setValueDiscounts(inss!, inssPercentege!)
        resultView.viewIRRFDiscounts.setValueDiscounts(irrf!, irrfPercentege!)
        resultView.viewNetSalary.setValue(netSalary!)

       
    }
    
    override func loadView() {
        view = resultView
    }
}

extension ResultViewController: ResultViewDelegate {
    func backToPreviousView() {
        self.dismiss(animated: true)
    }
    
    
}
