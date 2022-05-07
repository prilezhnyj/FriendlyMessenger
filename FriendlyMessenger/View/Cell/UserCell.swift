//
//  UserCell.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 07.05.2022.
//

import UIKit

class UserCell: UICollectionViewCell, ConfigurationUsersCellProtocol {
    
    static let cellID = "UserCell"
    
    let avatarUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userNameLabel = UILabel(text: "", textColor: SetupColor.blackColor(), alignment: .center, font: SetupFont.montserratBold(size: 17))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        self.bottomAnchor.constraint(equalTo: userNameLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarUserImageView.layer.cornerRadius = avatarUserImageView.frame.height / 2
        avatarUserImageView.clipsToBounds = true
    }

    func configure(with value: UsersModel) {
        avatarUserImageView.image = UIImage(named: value.avatarStringURL)
        userNameLabel.text = value.username
    }

}

// MARK: - Installing constraints
extension UserCell {
    private func setupConstraints() {
        
        self.addSubview(avatarUserImageView)
        self.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            avatarUserImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            avatarUserImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            avatarUserImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarUserImageView.widthAnchor.constraint(equalToConstant: 150)])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: avatarUserImageView.bottomAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
}
