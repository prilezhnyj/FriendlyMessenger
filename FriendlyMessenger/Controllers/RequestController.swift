//
//  RequestController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 18.05.2022.
//

import UIKit

class RequestController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "human6")
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
    
    let nameLabel = UILabel(text: "Maxim Botalov", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratBold(size: 20))
    
    let discriptionLabel = UILabel(text: descriptionProfileScreen, textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    
    let acceptButton = UIButton(titleText: "Accept", titleFont: SetupFont.montserratRegular(size: 17), titleColor: SetupColor.whiteColor(), backgroundColor: SetupColor.blackColor(), cornerRadius: 20, isShadow: true, isBorder: true)
    
    let denyButton = UIButton(titleText: "Deny", titleFont: SetupFont.montserratRegular(size: 17), titleColor: SetupColor.blackColor(), backgroundColor: SetupColor.whiteColor(), cornerRadius: 20, isShadow: true, isBorder: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        
        acceptButton.addTarget(self, action: #selector(acceptButtonAction), for: .touchUpInside)
        denyButton.addTarget(self, action: #selector(denyButtonAction), for: .touchUpInside)
    }
    
    // MARK: @objc methods
    @objc private func acceptButtonAction() {
        print(#function)
    }
    
    @objc private func denyButtonAction() {
        print(#function)
    }
    
}

// MARK: - Installing constraints
extension RequestController {
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
        
        let buttonStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], distribution: .fillEqually, axis: .horizontal, spacing: 10, alignment: .fill)
        
        containerView.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            buttonStackView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40)])

    }
}
