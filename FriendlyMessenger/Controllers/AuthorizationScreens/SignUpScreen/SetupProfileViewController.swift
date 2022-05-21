//
//  SetupProfileViewController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 01.05.2022.
//

import UIKit
import FirebaseAuth

class SetupProfileViewController: UIViewController {
    
    let headerTitleLabel = UILabel(text: "Profile setting", textColor: SetupColor.blackColor(), alignment: .center, font: SetupFont.montserratBold(size: 32))
    
    let addPhotoView = AddPhotoView()
    
    let firstNameLabel = UILabel(text: "Your first name", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let firstNameTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: false)
    
    let secondNameLabel = UILabel(text: "Your second name", textColor: SetupColor.blackColor(), alignment: .left, font: SetupFont.montserratRegular(size: 14))
    let secondNameTextField = CustomTextField(font: SetupFont.montserratRegular(size: 17), isSecure: false)
    
    let genderSelection: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.backgroundColor = SetupColor.secondaryWhiteColor()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    let saveButton = UIButton(titleText: "Save and continue", titleFont: SetupFont.montserratBold(size: 14), titleColor: SetupColor.whiteColor(), backgroundColor: SetupColor.blackColor(), cornerRadius: 20, isShadow: true, isBorder: false)
    
    private let currentUser: User
    
    init(currnetUser: User) {
        self.currentUser = currnetUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.whiteColor()
        setupConstraints()
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
}

extension SetupProfileViewController {
    @objc private func saveButtonAction() {
        
        
        FirestoreServices.shared.saveProfile(id: currentUser.uid, email: currentUser.email!, username: firstNameTextField.text, avatarImageString: "", discription: secondNameTextField.text, sex: genderSelection.titleForSegment(at: genderSelection.selectedSegmentIndex)) { result in
            
            switch result {
                
            case .success(let user):
                self.showAlert(with: "Success", and: "Приятного общения \(user.username)")
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        }
        
        print("Сохранено")
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
