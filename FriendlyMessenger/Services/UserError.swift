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
    case cannotGedUserInfo
    case cannotUnwrapToUser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .notField: return NSLocalizedString("Заполните все поля", comment: "")
            case .photoNotExist: return NSLocalizedString("Добавьте фото", comment: "")
            case .cannotGedUserInfo: return NSLocalizedString("Данные о пользователе не найдены", comment: "")
            case .cannotUnwrapToUser: return NSLocalizedString("Невозможно конвертировать", comment: "")
            
        }
    }
}
