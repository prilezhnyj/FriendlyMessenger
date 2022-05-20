//
//  UIAlertController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 18.05.2022.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String, complition: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default) { _ in
            complition()
        }
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
}
