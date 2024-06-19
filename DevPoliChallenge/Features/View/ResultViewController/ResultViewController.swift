//
//  SecondViewController.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var resultView: ResultView
    private var data: [String] = []
    
    lazy var viewModel: ResultViewModel = {
        let viewModel = ResultViewModel(delegate: self)
        return viewModel
    }()
    
    init(resultView: ResultView) {
        self.resultView = resultView
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
        resultView.callTheActionVerify()
    }
    
    override func loadView() {
        view = resultView
    }
}

extension ResultViewController: ResultViewDelegate {
    
    func sendDataToVerify(value: String, percentage: String, view: Any) {
        viewModel.verifyData(data: value, view: view)
    }
    
    func backToPreviousView() {
        self.dismiss(animated: true)
    }
}

extension ResultViewController: ResultViewModelDelegate {
    func configValueEqualZero(view: Any) {
        resultView.configValueEqualZero(view: view)
    }
    
    func configValueDifferentZero(view: Any) {
        resultView.configValueDifferentZero(view: view)
    }
  
}
