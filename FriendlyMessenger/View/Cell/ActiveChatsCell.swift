//
//  ActiveChatsCell.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 03.05.2022.
//

import UIKit

class ActiveChatsCell: UICollectionViewCell, ConfigurationChatsCellProtocol {
    
    static let cellID = "ActiveChatsCell"
    
    let avatarUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userNameLabel = UILabel(text: "", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratBold(size: 17))
    let lastMessageLabel = UILabel(text: "", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarUserImageView.layer.cornerRadius = avatarUserImageView.frame.height / 2
        avatarUserImageView.clipsToBounds = true
    }
    
    func configure(with value: ChatsModel) {
        avatarUserImageView.image = UIImage(named: value.userImageString)
        userNameLabel.text = value.username
        lastMessageLabel.text = value.lastMessage
    }
}

// MARK: - Installing constraints
extension ActiveChatsCell {
    private func setupConstraints() {
        
        self.addSubview(avatarUserImageView)
        self.addSubview(userNameLabel)
        self.addSubview(lastMessageLabel)
        
        NSLayoutConstraint.activate([
            avatarUserImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            avatarUserImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            avatarUserImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarUserImageView.widthAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarUserImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)])
        
        NSLayoutConstraint.activate([
            lastMessageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            lastMessageLabel.leadingAnchor.constraint(equalTo: avatarUserImageView.trailingAnchor, constant: 10)])
    }
}
