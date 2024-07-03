//
//  HomeView.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func verifyDatas(salary: String?, discounts: String?)
}

protocol HomeViewInput {
    var delegate: HomeViewDelegate? { get set }
}

final class HomeView: UIView, HomeViewInput {
    
    weak var delegate: HomeViewDelegate?
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 12
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var salaryField: UITextField = {
        let textField = CustomTextField(placeHolder: "Salário bruto")
        textField.addAction(UIAction {_ in
            if let text = textField.text?.currencyInputFormatting() {
                textField.text = text
            }
        }, for: .editingChanged)
        return textField
    }()
    
    private lazy var discountsField: UITextField = {
        let textField = CustomTextField(placeHolder: "Descontos")
        textField.addAction(UIAction {_ in
                if let text = textField.text?.currencyInputFormatting() {
                    textField.text = text
                }
        }, for: .editingChanged)
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.primary
        button.setTitle("CALCULAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func calculateButtonTapped(){
        delegate?.verifyDatas(salary: salaryField.text, discounts: discountsField.text)
    }
}

extension HomeView: ViewConfig {
    func buildViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(salaryField)
        stackView.addArrangedSubview(discountsField)
        addSubview(button)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 137),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 22),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func extraSetup() {
        backgroundColor = DesignSystem.Colors.backgroundView
    }
}


