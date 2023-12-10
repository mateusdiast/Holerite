//
//  ContainerTwoView.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 07/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class ContainerTwoView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(labelTitle)
        self.addSubview(labelValue)
        self.addSubview(labelPercentage)
    }


    
    lazy var labelTitle: UILabel = {
         let label = UILabel()
         label.text = "Label"
         label.font = UIFont.boldSystemFont(ofSize: 15)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var labelValue: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelPercentage: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = DesignSystem.Colors.secondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
                
            
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            
            labelValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelValue.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                   
            labelPercentage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelPercentage.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 2)
            
        ])
    }
    
    func setValueDiscounts(_ labelValue: String, _ labelPercentageValue: String){
        self.labelValue.text = labelValue
        self.labelPercentage.text = "\(labelPercentageValue)%"
        
        if self.labelValue.text == "R$0.00" {
            self.labelValue.textColor = DesignSystem.Colors.secondary
            self.labelValue.attributedText = labelValue.strikeThrough()
            self.labelPercentage.textColor = DesignSystem.Colors.secondary
        }else{
            self.labelValue.textColor = DesignSystem.Colors.tertiary
        }
    }

}
