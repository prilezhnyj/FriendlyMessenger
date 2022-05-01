//
//  AddPhotoView.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 01.05.2022.
//

import UIKit

class AddPhotoView: UIView {
    
    let addPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = SetupColor.whiteColor()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = SetupColor.whiteColor()
        button.titleLabel?.font = SetupFont.montserratBold(size: 14)
        button.setTitle("Add photo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: addPhotoImageView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: addPhotoImageView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: addPhotoImageView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: addPhotoButton.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addPhotoImageView.layer.cornerRadius = addPhotoImageView.frame.height / 2
        addPhotoImageView.clipsToBounds = true
    }
}

// MARK: - Installing constraints
extension AddPhotoView {
    private func setupConstraints() {

        // MARK: Add Photo
        self.addSubview(addPhotoImageView)
        NSLayoutConstraint.activate([
            addPhotoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            addPhotoImageView.widthAnchor.constraint(equalToConstant: 100)])
        
        self.addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: addPhotoImageView.bottomAnchor, constant: 0)])
    }
}


