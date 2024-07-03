//
//  ContainerResultView.swift
//  DevPoliChallenge-Holerite
//
//  Created by Mateus Dias on 16/06/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

final class ContainerResultView: UIView {
    

    private var value: String?
    private var percentage: String?
    private var color: UIColor
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 2
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelValue: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelPercentage: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = DesignSystem.Colors.secondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setData(title: String, value: String, percentage: String){
        labelTitle.text = title
        labelValue.text = value
        labelPercentage.text = percentage + "%"
        labelValue.setStyleTextLabel(value: value, color: color)
    }
    
    func setupPercetage(){
        labelPercentage.isHidden = false
    }
    
}

extension ContainerResultView: ViewConfig {
    func buildViews() {
        self.addSubview(stackView)
        self.addSubview(labelValue)
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelPercentage)
    }
    
    func pin() {
        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
                    
            labelValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelValue.centerYAnchor.constraint(equalTo: self.centerYAnchor),

        ])
    }
    
    func extraSetup() {
        backgroundColor = .white
    }
    
    
}
