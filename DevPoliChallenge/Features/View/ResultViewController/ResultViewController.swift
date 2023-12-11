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
    
    var resultStringModel = ResultStringModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
        resultView.viewGrossSalary.setValue(resultStringModel.salary)
        resultView.viewDiscounts.setValueDiscounts(resultStringModel.discount)
        resultView.viewINSSDiscounts.setValueDiscounts(resultStringModel.inssValue, resultStringModel.inssPercentage)
        resultView.viewIRRFDiscounts.setValueDiscounts(resultStringModel.irrfValue, resultStringModel.irrfPercentage)
        resultView.viewNetSalary.setValue(resultStringModel.netSalary)
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
