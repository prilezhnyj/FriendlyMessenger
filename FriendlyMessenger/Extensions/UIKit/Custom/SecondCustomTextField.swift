//
//  SecondCustomTextField.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 17.05.2022.
//

import UIKit

class SecondCustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        placeholder = "Write something here..."
        font = SetupFont.montserratRegular(size: 14)
        backgroundColor = SetupColor.whiteColor()
        borderStyle = .roundedRect
        clearButtonMode = .whileEditing
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        let rightButton = UIButton(type: .system)
        rightButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        rightButton.tintColor = SetupColor.blackColor()
        rightView = rightButton
        rightView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        rightViewMode = .always
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 40)
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x += -10
        return rect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
