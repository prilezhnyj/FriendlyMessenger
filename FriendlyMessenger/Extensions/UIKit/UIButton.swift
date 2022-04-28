//
//  UIButton.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 29.04.2022.
//

import UIKit

extension UIButton {
    convenience init(titleText: String, titleFont: UIFont, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, isShadow: Bool, isBorder: Bool) {
        self.init(type: .system)
        self.setTitle(titleText, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = titleFont
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if isShadow == true {
            self.layer.shadowColor = UIColor.white.cgColor
            self.layer.shadowOpacity = 0.2
            self.layer.shadowRadius = 5
            self.layer.shadowOffset = CGSize(width: 4, height: 4)
        }
        
        if isBorder == true {
            self.layer.borderWidth = 0.1
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
    
//    func castomizeGoogleButton() {
//        let googleLogo = UIImageView(image: UIImage(named: "Google"))
//        googleLogo.translatesAutoresizingMaskIntoConstraints = false
//
//        googleLogo.layer.shadowColor = UIColor.black.cgColor
//        googleLogo.layer.shadowOpacity = 0.2
//        googleLogo.layer.shadowRadius = 5
//        googleLogo.layer.shadowOffset = CGSize(width: 4, height: 4)
//
//        self.addSubview(googleLogo)
//        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    }
}
