//
//  ConfigurationCellProtocol.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 07.05.2022.
//

import Foundation

protocol ConfigurationChatsCellProtocol {
    static var cellID: String { get }
    func configure(with value: ChatsModel)
}

protocol ConfigurationUsersCellProtocol {
    static var cellID: String { get }
    func configure(with value: UsersModel)
}
