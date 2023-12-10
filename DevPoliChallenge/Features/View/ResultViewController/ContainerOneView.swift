//
//  ContainerOneView.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 06/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class ContainerOneView: UIView {
    
    
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
    }

   lazy var labelTitle: UILabel = {
         let label = UILabel()
         label.text = "Label"
         label.font = UIFont.boldSystemFont(ofSize: 15)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    private lazy var labelValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = DesignSystem.Colors.accent
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
                
            
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            labelValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelValue.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
    }
    
    func setValue(_ labelValue: String){
        self.labelValue.text = labelValue
        self.labelValue.textColor = DesignSystem.Colors.accent
    }
    
    func setValueDiscounts(_ labelValue: String){
        self.labelValue.text = labelValue
        
        if self.labelValue.text == "R$0.00" {
            self.labelValue.textColor = DesignSystem.Colors.secondary
            self.labelValue.attributedText = labelValue.strikeThrough()
        }else{
            self.labelValue.textColor = DesignSystem.Colors.tertiary
        }
    }

}
