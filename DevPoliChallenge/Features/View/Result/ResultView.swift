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
}

protocol ResultViewInput {
    var delegate: ResultViewDelegate? {get set}
    func setData(salary: ResultModel, discounts: ResultModel, discountINSS: ResultModel, discountIRRF: ResultModel, netSalary: ResultModel)
}

final class ResultView: UIView, ResultViewInput {
    
    weak var delegate: ResultViewDelegate?
    
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
        let view = ContainerResultView(color: DesignSystem.Colors.accent)
        return view as ContainerResultView
    }()
    
    private lazy var viewDiscounts: ContainerResultView = {
        let view = ContainerResultView(color: DesignSystem.Colors.tertiary)
        return view as ContainerResultView
    }()
    
    private lazy var viewINSSDiscounts: ContainerResultView = {
        let view = ContainerResultView(color: DesignSystem.Colors.tertiary)
        view.setupPercetage()
        return view
    }()
    
    private lazy var viewIRRFDiscounts: ContainerResultView = {
        let view = ContainerResultView(color: DesignSystem.Colors.tertiary)
        view.setupPercetage()
        return view
    }()
    
    private lazy var viewNetSalary: ContainerResultView = {
        let view = ContainerResultView(color: DesignSystem.Colors.accent)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func backButtonTapped(){
        delegate?.backToPreviousView()
    }
    
    
    func setData(salary: ResultModel, discounts: ResultModel, discountINSS: ResultModel, discountIRRF: ResultModel, netSalary: ResultModel) {
        viewGrossSalary.setData(title: salary.name, value: String(salary.value).currencyFormatting(), percentage: "")
        viewDiscounts.setData(title: discounts.name, value: String(discounts.value).currencyFormatting(), percentage: "")
        viewIRRFDiscounts.setData(title: discountIRRF.name, value: String(discountIRRF.value).currencyFormatting(), percentage: String(format: "%.0f%", discountIRRF.porcentage ?? 0.0))
        viewINSSDiscounts.setData(title: discountINSS.name, value: String(discountINSS.value).currencyFormatting(), percentage: String(format: "%.0f%", discountINSS.porcentage ?? 0.0))
        viewNetSalary.setData(title: netSalary.name, value: String(netSalary.value).currencyFormatting(), percentage: "")
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

