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
    
    private var values: [String]
    
    init(values: [String]) {
        self.values = values
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
        resultView.viewGrossSalary.setValue(values[3])
        resultView.viewDiscounts.setValueDiscounts(values[2])
        resultView.viewINSSDiscounts.setValueDiscounts(values[0], values[5])
        resultView.viewIRRFDiscounts.setValueDiscounts(values[1], values[6])
        resultView.viewNetSalary.setValue(values[4])
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
