//
//  SecondViewController.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {
    
    private var resultView: ResultViewInput
    private var viewModel: ResultViewModelInput
    private var data: [String] = []

    init(resultView: ResultViewInput, viewModel: ResultViewModelInput) {
        self.resultView = resultView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
        viewModel.delegate = self
        viewModel.loadResult()
    }
    
    override func loadView() {
        view = resultView as? UIView
    }
}

extension ResultViewController: ResultViewDelegate {
    
    func backToPreviousView() {
        self.dismiss(animated: true)
    }
}

extension ResultViewController: ResultViewModelDelegate {
    func sendData(salary: ResultModel, discounts: ResultModel, discountINSS: ResultModel, discountIRRF: ResultModel, netSalary: ResultModel) {
        resultView.setData(salary: salary, discounts: discounts, discountINSS: discountINSS, discountIRRF: discountIRRF, netSalary: netSalary)
    }
}
