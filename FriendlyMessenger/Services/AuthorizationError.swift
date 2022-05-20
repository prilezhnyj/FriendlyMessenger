//
//  AuthorizationError.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 19.05.2022.
//

import Foundation

enum AuthorizationError {
    case notField
    case invalidEmail
    case passwordNotMatched
    case unknownError
    case serverError
}

extension AuthorizationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notField:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Неверный формат email", comment: "")
        case .passwordNotMatched:
            return NSLocalizedString("Пароли не совпадают", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Сервер недоступен", comment: "")
        }
    }
}
