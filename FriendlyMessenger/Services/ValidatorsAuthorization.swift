//
//  ValidatorsAuthorization.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 19.05.2022.
//

import Foundation

class ValidatorsAuthorization {
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password,
        let confirmPassword = confirmPassword,
              let email = email,
              password != "",
              confirmPassword != "",
              email != "" else { return false }
        return true
    }
    
    static func isFilledModel(username: String?, discription: String?, sex: String?) -> Bool {
        guard let password = discription,
        let sex = sex,
              let email = username,
              password != "",
              sex != "",
              email != "" else { return false }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
        
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
