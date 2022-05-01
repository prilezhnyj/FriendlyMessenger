//
//  SignUpViewController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 28.04.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let headerTitleLabel = UILabel(text: "Welcome", textColor: SetupColor.whiteColor(), alignment: .center, font: SetupFont.montserratBold(size: 32))
    
    let loginHeaderLabel = UILabel(text: "Your mailbox", textColor: SetupColor.whiteColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let loginTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: false)
    
    let passwordHeaderLabel = UILabel(text: "Your password", textColor: SetupColor.whiteColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let passwordTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: true)
    
    let passwordAgainHeaderLabel = UILabel(text: "Your password again", textColor: SetupColor.whiteColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let passwordAgainTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: true)
    
    let signUpButton = UIButton(titleText: "Sign Up", titleFont: SetupFont.montserratRegular(size: 17), titleColor: SetupColor.blackColor(), backgroundColor: SetupColor.whiteColor(), cornerRadius: 20, isShadow: true, isBorder: false)
    let loginInButton = UIButton(titleText: "Login In", titleFont: SetupFont.montserratRegular(size: 17), titleColor: SetupColor.whiteColor(), backgroundColor: .clear, cornerRadius: 20, isShadow: true, isBorder: true)
    
    let lostYourPasswordLabel = UILabel(text: "Lost your password?", textColor: SetupColor.whiteColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let lostYourPasswordButton = UIButton(titleText: " Recover password", titleFont: SetupFont.montserratBold(size: 14), titleColor: SetupColor.whiteColor(), backgroundColor: .clear, cornerRadius: 20, isShadow: false, isBorder: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = SetupColor.secondaryBlackColor()
    }
}

// MARK: - Installing constraints
extension SignUpViewController {
    private func setupConstraints() {
        
        // MARK: Header title
        view.addSubview(headerTitleLabel)
        NSLayoutConstraint.activate([headerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                                     headerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        // MARK: Login & Password stackView
        let loginStackView = UIStackView(arrangedSubviews: [loginHeaderLabel, loginTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordHeaderLabel, passwordTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        let passwordAgainStackView = UIStackView(arrangedSubviews: [passwordAgainHeaderLabel, passwordAgainTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        let loginAndPasswordStackView = UIStackView(arrangedSubviews: [loginStackView, passwordStackView, passwordAgainStackView], distribution: .fill, axis: .vertical, spacing: 40, alignment: .fill)
        
        view.addSubview(loginAndPasswordStackView)
        NSLayoutConstraint.activate([
            loginAndPasswordStackView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 100),
            loginAndPasswordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginAndPasswordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        // MARK: Login In & Sing Up button
        let lostYourPasswordStackView = UIStackView(arrangedSubviews: [lostYourPasswordLabel, lostYourPasswordButton], distribution: .fill, axis: .horizontal, spacing: 5, alignment: .firstBaseline)
        let buttonStackView = UIStackView(arrangedSubviews: [signUpButton, loginInButton, lostYourPasswordStackView], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        lostYourPasswordButton.contentHorizontalAlignment = .leading
        
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
    }
}
