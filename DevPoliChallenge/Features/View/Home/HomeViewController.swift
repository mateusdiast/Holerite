//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    let homeViewModel = HomeViewModel()
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        homeViewModel.delegate = self
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
    func goToResult(_ salary: String, _ inss: String, _ irrf: String, _ netSalary: String, _ discounts: String, _ inssPercentage: String, _ irrfPercentage: String) {
        let vc = ResultViewController()
        vc.resultStringModel.salary = salary
        vc.resultStringModel.discount = discounts
        vc.resultStringModel.inssValue = inss
        vc.resultStringModel.irrfValue = irrf
        vc.resultStringModel.netSalary = netSalary
        vc.resultStringModel.inssPercentage = inssPercentage
        vc.resultStringModel.irrfPercentage = irrfPercentage
        self.present(vc, animated: true, completion: nil)
    }
    
    func alertValuesInvalidate() {
        let alert = UIAlertController(title: "Error", message: "Preencha o campo de texto!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}

extension HomeViewController: HomeViewDelegate {
    
    func verifyDatas(salary: String, discounts: String){
        homeViewModel.calculate(salary: salary, discounts: discounts)
    }
}
