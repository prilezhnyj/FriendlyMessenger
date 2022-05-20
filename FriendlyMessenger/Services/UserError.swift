//
//  UserError.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 20.05.2022.
//

import Foundation

enum UserError {
    case notField
    case photoNotExist
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .notField: return NSLocalizedString("Заполните все поля", comment: "")
            case .photoNotExist: return NSLocalizedString("Добавьте фото", comment: "")
        }
    }
}
