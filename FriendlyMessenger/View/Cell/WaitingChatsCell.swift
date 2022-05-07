//
//  WaitingChatsCell.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 07.05.2022.
//

import UIKit

class WaitingChatsCell: UICollectionViewCell, ConfigurationCellProtocol {
    
    static let cellID = "WaitingChatsCell"
    
    let avatarUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    }
}

// MARK: - Installing constraints
extension WaitingChatsCell {
    private func setupConstraints() {
        
        self.addSubview(avatarUserImageView)
        
        NSLayoutConstraint.activate([
            avatarUserImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            avatarUserImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            avatarUserImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarUserImageView.widthAnchor.constraint(equalToConstant: 80)])
    }
}
