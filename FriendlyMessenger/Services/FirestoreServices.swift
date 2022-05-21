//
//  FirestoreServices.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 20.05.2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class FirestoreServices {
    static let shared = FirestoreServices()
    
    let db = Firestore.firestore()
    
    private var usersRef: DocumentReference? = nil
    
    func getUserData(user: User, complition: @escaping (Result<UsersModel, Error>) -> Void) {
        let docRef = db.collection("users").document(user.uid)
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                guard let userModel = UsersModel(document: document) else {
                    complition(.failure(UserError.cannotUnwrapToUser))
                    return
                }
                complition(.success(userModel))
            } else {
                complition(.failure(UserError.cannotGedUserInfo))
            }
        }
    }
    
    func saveProfile(id: String, email: String, username: String?, avatarImageString: String?, discription: String?, sex: String?, complition: @escaping (Result<UsersModel, Error>) -> Void) {
        
        guard ValidatorsAuthorization.isFilledModel(username: username, discription: discription, sex: sex) else {
            complition(.failure(UserError.notField))
            return
        }
        
        let userModel = UsersModel(username: username!, email: email, discription: discription!, sex: sex!, avatarStringURL: "", uid: id)
        
        usersRef = db.collection("users").addDocument(data: userModel.representation, completion: { error in
            if let error = error {
                complition(.failure(error))
            } else {
                complition(.success(userModel))
            }
        })
    }
}
