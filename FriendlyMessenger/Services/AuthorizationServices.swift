//
//  AuthorizationServices.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 18.05.2022.
//

import UIKit
import FirebaseAuth

class AuthorizationServices {
    
    static let shared = AuthorizationServices()
    private let auth = Auth.auth()
    
    func login(email: String?, password: String?, complition: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                complition(.failure(error!))
                return
            }
            complition(.success(result.user))
        }
    }
    
    func registration(email: String?, password: String?, confirmPassword: String?, complition: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                complition(.failure(error!))
                return
            }
            complition(.success(result.user))
        }
    }
}

