//
//  LoginInViewController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 28.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let headerTitleLabel = UILabel(text: "Frendly Messager", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratBold(size: 32))
    
    let appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "AppLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel = UILabel(text: descriptionFirstScreen, textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratRegular(size: 17))
    
    let loginInButton = UIButton(titleText: "Login in", titleFont: SetupFont.montserratRegular(size: 17), titleColor: SetupColor.whiteColor(), backgroundColor: SetupColor.blackColor(), cornerRadius: 20, isShadow: true, isBorder: false)
    let signUpButton = UIButton(titleText: "Sign up", titleFont: SetupFont.montserratRegular(size: 17), titleColor: SetupColor.blackColor(), backgroundColor: .clear, cornerRadius: 20, isShadow: true, isBorder: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.whiteColor()
        setupConstraints()
        
        //MARK: Switching to other screens
        loginInButton.addTarget(self, action: #selector(pushLoginInViewController), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(pushSignUpViewController), for: .touchUpInside)
    }
}

// MARK: - @objc methods
extension MainViewController {
    @objc private func pushLoginInViewController() {
        present(LoginInViewController(), animated: true)
    }
    
    @objc private func pushSignUpViewController() {
        present(SignUpViewController(), animated: true)
    }
}

// MARK: - Installing constraints
extension MainViewController {
    private func setupConstraints() {
        
        // MARK: Logo
        headerTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        headerTitleLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        appLogoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        appLogoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let logoStackView = UIStackView(arrangedSubviews: [appLogoImageView, headerTitleLabel], distribution: .fill, axis: .horizontal, spacing: 20, alignment: .fill)
    
        view.addSubview(logoStackView)
        NSLayoutConstraint.activate([
            logoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoStackView.heightAnchor.constraint(equalToConstant: 80),
            logoStackView.widthAnchor.constraint(equalToConstant: 270)])
        
        // MARK: Description
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: logoStackView.bottomAnchor, constant: 40),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 270),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        
        // MARK: Login in button
        let buttonStackView = UIStackView(arrangedSubviews: [loginInButton, signUpButton], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalToConstant: 270)])
    }
}
