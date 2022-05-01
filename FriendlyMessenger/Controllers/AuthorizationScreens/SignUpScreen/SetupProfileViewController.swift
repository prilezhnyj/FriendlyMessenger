//
//  SetupProfileViewController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 01.05.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let headerTitleLabel = UILabel(text: "Profile setting", textColor: SetupColor.whiteColor(), alignment: .center, font: SetupFont.montserratBold(size: 32))
    
    let addPhotoView = AddPhotoView()
    
    let firstNameLabel = UILabel(text: "Your first name", textColor: SetupColor.whiteColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let firstNameTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: false)
    
    let secondNameLabel = UILabel(text: "Your second name", textColor: SetupColor.whiteColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let secondNameTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: false)
    
    let genderSelection: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.backgroundColor = SetupColor.whiteColor()
        segmentedControl.selectedSegmentTintColor = SetupColor.whiteColor()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    let saveButton = UIButton(titleText: "Save and continue", titleFont: SetupFont.montserratBold(size: 14), titleColor: SetupColor.blackColor(), backgroundColor: SetupColor.whiteColor(), cornerRadius: 20, isShadow: true, isBorder: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.secondaryBlackColor()
        setupConstraints()
    }
}

// MARK: - Installing constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        
        // MARK: Header title
        view.addSubview(headerTitleLabel)
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            headerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        // MARK: Add Photo View
        view.addSubview(addPhotoView)
        NSLayoutConstraint.activate([
            addPhotoView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 50),
            addPhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        // MARK: FirstName & SecondName StackView
        let firstNameStackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        let secondNameStackView = UIStackView(arrangedSubviews: [secondNameLabel, secondNameTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        let firstAndSecondNameStackView = UIStackView(arrangedSubviews: [firstNameStackView, secondNameStackView], distribution: .fill, axis: .vertical, spacing: 30, alignment: .fill)
        
        view.addSubview(firstAndSecondNameStackView)
        NSLayoutConstraint.activate([
            firstAndSecondNameStackView.topAnchor.constraint(equalTo: addPhotoView.bottomAnchor, constant: 30),
            firstAndSecondNameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstAndSecondNameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        // MARK: Gender Selection
        view.addSubview(genderSelection)
        NSLayoutConstraint.activate([
            genderSelection.topAnchor.constraint(equalTo: firstAndSecondNameStackView.bottomAnchor, constant: 30),
            genderSelection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            genderSelection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        // MARK: Gender Selection
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
    }
}
