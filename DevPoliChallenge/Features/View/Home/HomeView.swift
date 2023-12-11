//
//  HomeView.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 04/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func verifyDatas(salary: String, discounts: String) 
}

final class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    var amtSalaryField: Int = 0
    var amtDiscountField: Int = 0
    
    private lazy var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        return formatter
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            salaryField,
            discountsField
        ])
        view.spacing = 12
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    private lazy var salaryField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Salário bruto"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor =  DesignSystem.Colors.borderColor.cgColor
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var discountsField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Descontos"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor =  DesignSystem.Colors.borderColor.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.primary
        button.setTitle("CALCULAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextViewTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = DesignSystem.Colors.backgroundView
        setupView()
        setupConstraints()
        salaryField.delegate = self
        discountsField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func nextViewTapped(){
        delegate?.verifyDatas(salary: salaryField.text!, discounts: discountsField.text!)
    }
    
    private func setupView(){
        addSubview(stackView)
        addSubview(button)
    }
    

    private func setupConstraints(){
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
    
}

extension HomeView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
       if textField == salaryField {
          if let digit = Int(string){
              amtSalaryField = amtSalaryField * 10 + digit
              print(amtSalaryField)
              salaryField.text = updateSalaryField()
           }
           if string == "" {
               amtSalaryField = amtSalaryField/10
               salaryField.text = updateSalaryField()
           }
       }
   
        if textField == discountsField{
            if let digit = Int(string){
                amtDiscountField = amtDiscountField * 10 + digit
                discountsField.text = updateDiscountField()
          }
            if string == "" {
                amtDiscountField = amtDiscountField/10
                discountsField.text = updateDiscountField()
            }
       }
 
       return false
   
    }
    
}

extension HomeView {
    
    func updateSalaryField() -> String? {
        let number = Double(amtSalaryField/100) + Double(amtSalaryField%100) / 100
        return currencyFormatter.string(from: number as NSNumber)
    }
    
    func updateDiscountField() -> String? {
        let number = Double(amtDiscountField/100) + Double(amtDiscountField%100) / 100
        return currencyFormatter.string(from: number as NSNumber)
    }
 
}
    
    
    


