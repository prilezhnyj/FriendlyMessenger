//
//  SectionHeader.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 07.05.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let sectionID = "SectionHeader"
    
    let titleHeaderLabel = UILabel(text: "", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratBold(size: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationHeader(text: String, font: UIFont, color: UIColor) {
        titleHeaderLabel.text = text
        titleHeaderLabel.textColor = color
        titleHeaderLabel.font = font
    }
}

// MARK: - Installing constraints
extension SectionHeader {
    private func setupConstraints() {
        
        self.addSubview(titleHeaderLabel)
        NSLayoutConstraint.activate([
            titleHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleHeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleHeaderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
