//
//  UILabel.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 29.04.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, alignment: NSTextAlignment, font: UIFont) {
        self.init()
        self.text = text
        self.numberOfLines = 0
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
