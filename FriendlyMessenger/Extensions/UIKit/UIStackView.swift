//
//  UIStackView.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 29.04.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: UIStackView.Alignment) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
        self.alignment = .fill
        self.contentHuggingPriority(for: .horizontal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
