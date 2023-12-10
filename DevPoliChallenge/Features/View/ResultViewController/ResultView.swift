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

final class ResultView: UIView {
    
    weak var delegate: ResultViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = DesignSystem.Colors.backgroundView
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            viewGrossSalary,
            viewDiscounts,
            viewINSSDiscounts,
            viewIRRFDiscounts,
            viewNetSalary
        ])
        view.spacing = 1
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //VIEWS
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("FECHAR", for: .normal)
        button.setTitleColor(DesignSystem.Colors.backButtonColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var viewGrossSalary: ContainerOneView = {
        let view = ContainerOneView()
        view.labelTitle.text = "Salário Bruto"
        return view
    }()
    
    lazy var viewDiscounts: ContainerOneView = {
        let view = ContainerOneView()
        view.labelTitle.text = "Descontos"
        return view
    }()
    
    lazy var viewINSSDiscounts: ContainerTwoView = {
        let view = ContainerTwoView()
        view.labelTitle.text = "Desconto INSS"
        view.labelPercentage.text = "0%"
        return view
    }()
    
    lazy var viewIRRFDiscounts: ContainerTwoView = {
        let view = ContainerTwoView()
        view.labelTitle.text = "Desconto IRRF"
        view.labelPercentage.text = "0%"
        return view
    }()
    
    lazy var viewNetSalary: ContainerOneView = {
        let view = ContainerOneView()
        view.labelTitle.text = "Salário liquido"
        return view
    }()
    

    private func setupView(){
        self.addSubview(stackView)
        self.addSubview(backButton)
    }

    private func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 68),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 304),
            
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            backButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    @objc func backButtonTapped(){
        delegate?.backToPreviousView()
    }
}
