//
//  ResultView.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 05/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol ResultViewDelegate: AnyObject{
    func backToPreviousView()
    func sendDataToVerify(value: String, percentage: String, view: Any)
}

protocol ResultViewInput {
    var delegate: ResultViewDelegate? {get set}
    func callTheActionVerify()
    func configValueEqualZero(view: Any)
    func configValueDifferentZero(view: Any)
}

final class ResultView: UIView, ResultViewInput {
    
    weak var delegate: ResultViewDelegate?
    
    private var data: [String] = []
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 1
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("FECHAR", for: .normal)
        button.setTitleColor(DesignSystem.Colors.backButtonColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
   private lazy var viewGrossSalary: ContainerResultView = {
       let view = ContainerResultView(delegate: self, color: DesignSystem.Colors.accent)
        view.setData(title: "Salário Bruno", value: data[3], percentage: "")
        return view as ContainerResultView
    }()
    
   private lazy var viewDiscounts: ContainerResultView = {
       let view = ContainerResultView(delegate: self, color: DesignSystem.Colors.tertiary)
        view.setData(title: "Descontos", value: data[2], percentage: "")
        return view as ContainerResultView
    }()
    
   private lazy var viewINSSDiscounts: ContainerResultView = {
       let view = ContainerResultView(delegate: self, color: DesignSystem.Colors.tertiary)
        view.setData(title: "Desconto INSS", value: data[0], percentage: data[5])
        view.setupPercetage()
        return view
    }()
    
   private lazy var viewIRRFDiscounts: ContainerResultView = {
       let view = ContainerResultView(delegate: self, color: DesignSystem.Colors.tertiary)
        view.setData(title: "Desconto IRRF", value: data[1], percentage: data[6])
        view.setupPercetage()
        return view
    }()
    
   private lazy var viewNetSalary: ContainerResultView = {
       let view = ContainerResultView(delegate: self, color: DesignSystem.Colors.accent)
        view.setData(title: "Salário liquido", value: data[4], percentage: "")
        return view
    }()
    
    init(data: [String]) {
        self.data = data
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func backButtonTapped(){
        delegate?.backToPreviousView()
    }
    
    func callTheActionVerify(){
        viewGrossSalary.sendDataToVerify()
        viewDiscounts.sendDataToVerify()
        viewNetSalary.sendDataToVerify()
        viewINSSDiscounts.sendDataToVerify()
        viewIRRFDiscounts.sendDataToVerify()
    }
    
    func configValueEqualZero(view: Any){
        if let view = view as? ContainerResultView {
            view.setConfigValueEqualZero()
        }
    }
    
    func configValueDifferentZero(view: Any) {
        if let view = view as? ContainerResultView {
            view.setConfigValueDifferentZero()
        }
    }
    
}

extension ResultView: ViewConfig {
    func buildViews() {
        addSubview(stackView)
        addSubview(backButton)
        stackView.addArrangedSubview(viewGrossSalary)
        stackView.addArrangedSubview(viewDiscounts)
        stackView.addArrangedSubview(viewINSSDiscounts)
        stackView.addArrangedSubview(viewIRRFDiscounts)
        stackView.addArrangedSubview(viewNetSalary)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 68),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 364),
            
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            backButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func extraSetup() {
        backgroundColor = DesignSystem.Colors.backgroundView
    }
    
    
}

extension ResultView: ContainerResultViewDelegate {
    func sendDataToVerify(value: String, percentage: String, view: Any) {
        delegate?.sendDataToVerify(value: value, percentage: percentage, view: view)
    }
}
