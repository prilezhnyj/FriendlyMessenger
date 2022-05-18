//
//  ProfileController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 17.05.2022.
//

import UIKit

class ProfileController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "human1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = SetupColor.whiteColor()
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messageTextField = SecondCustomTextField()
    
    let nameLabel = UILabel(text: "Maxim Botalov", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratBold(size: 20))
    
    let discriptionLabel = UILabel(text: descriptionProfileScreen, textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        
        if let buttonSendMessage = messageTextField.rightView as? UIButton {
            buttonSendMessage.addTarget(self, action: #selector(sendMessageAction), for: .touchUpInside)
        }
    }
    
    // MARK: @objc methods
    @objc private func sendMessageAction() {
        let textInTextFileds = messageTextField.text ?? ""
        print(textInTextFileds)
    }
}

// MARK: - Installing constraints
extension ProfileController {
    private func setupConstraints() {
        
        // MARK: backgroundImageView
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        // MARK: containerView
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 210)])
        
        // MARK: nameLabel
        containerView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15)])
        
        // MARK: nameLabel
        containerView.addSubview(discriptionLabel)
        NSLayoutConstraint.activate([
            discriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            discriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            discriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)])
        
        // MARK: nameLabel
        containerView.addSubview(messageTextField)
        NSLayoutConstraint.activate([
            messageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            messageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            messageTextField.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 20),
            messageTextField.heightAnchor.constraint(equalToConstant: 48)])

    }
}
