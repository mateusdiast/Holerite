//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeViewModel: HomeViewModel  = {
        let viewModel = HomeViewModel(formatterSalary: FormatterSalary(),
                                      formatterDiscount: FormatterSalary(),
                                      inssCalculator: INSSCalculator(inss: INSSModel()),
                                      irrfCalculator: IRRFCalculator(irrf: IRRFModel()),
                                      salaryCalculator: SalaryCalculator(),
                                      delegate: self)
        return viewModel
    }()

    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        homeView.delegate = self
    }
    
    override func loadView() {
        self.view = homeView
    }
    

    func setupNavigation(){
        navigationItem.title = "Holerite"
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    
    func alertDataInvalid() {
        let alert = UIAlertController(title: "Número invalido!", message: "Insira um número valido!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func sendDataSalaryField(value: Double) {
        homeView.updateSalaryField(value: value)
    }
    
    func sendDataDiscountsField(value: Double) {
        homeView.updateDiscountField(value: value)
    }
    
    func goToResult(values: [String]) {
        let vc = ResultViewController(values: values)
        self.present(vc, animated: true, completion: nil)
    }
    
    func alertFieldEmpty() {
        let alert = UIAlertController(title: "Error", message: "Preencha o campo de salário!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}

extension HomeViewController: HomeViewDelegate {
    
    func sendDataTyped(value: String, key: Int) {
        homeViewModel.validadeDataTyped(value: value, key: key)
    }
    
    
    
    func verifyDatas(salary: String, discounts: String){
        homeViewModel.verifyData(salary: salary, discounts: discounts)
    }
}
