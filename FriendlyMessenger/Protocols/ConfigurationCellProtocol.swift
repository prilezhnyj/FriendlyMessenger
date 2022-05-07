//
//  ConfigurationCellProtocol.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 07.05.2022.
//

import Foundation

protocol ConfigurationCellProtocol {
    static var cellID: String { get }
    func configure(with value: ChatsModel)
}
