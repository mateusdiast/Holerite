//
//  SceneDelegate.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = HomeViewController(view: HomeView(), viewModel: HomeViewModel(
            formatterSalary: FormatterSalary(),
            formatterDiscount: FormatterSalary(),
            inssCalculator: INSSCalculator(inss: INSSModel()),
            irrfCalculator: IRRFCalculator(irrf: IRRFModel()),
            salaryCalculator: SalaryCalculator()
        ))
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        self.window = window    
    }

}

