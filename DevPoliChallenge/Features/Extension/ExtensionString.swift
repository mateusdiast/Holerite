//
//  ExtensionString.swift
//  DevPoliChallenge-Holerite
//
//  Created by mateusdias on 10/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//


import UIKit


extension String {
    func strikeThrough() -> NSAttributedString {
           let attributeString =  NSMutableAttributedString(string: self)
           attributeString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0,length: attributeString.length))
           return attributeString
       }
}
