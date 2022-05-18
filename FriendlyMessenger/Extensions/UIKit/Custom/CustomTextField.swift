//
//  CustomTextField.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 30.04.2022.
//

import UIKit

class CustomTextField: UITextField {
    convenience init(font: UIFont, isSecure: Bool) {
        self.init()
        self.font = font
        self.textColor = SetupColor.blackColor()
        self.autocapitalizationType = .none
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if isSecure == true {
            self.isSecureTextEntry = true
        } else {
            self.isSecureTextEntry = false
        }
        
        let buttomLine = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        buttomLine.backgroundColor = SetupColor.blackColor()
        buttomLine.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttomLine)
        NSLayoutConstraint.activate([
            buttomLine.heightAnchor.constraint(equalToConstant: 1),
            buttomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
}
