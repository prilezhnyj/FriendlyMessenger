//
//  FirestoreServices.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 20.05.2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirestoreServices {
    static let shared = FirestoreServices()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProvile(id: String, email: String, userName: String?, avaratImageString: String?, discription: String?, sex: String?, complition: @escaping (Result<UsersModel, Error>) -> Void) {
        
        guard ValidatorsAuthorization.isFilledModel(userName: userName, discription: discription, sex: sex) else { complition(.failure(UserError.notField))
            return
        }
        
        let modelUser = UsersModel(username: userName!, email: email, discription: discription!, sex: sex!, avatarStringURL: "", id: id)
        
        self.usersRef.document(modelUser.id).setData(modelUser.representation) { error in
            if let error = error {
                complition(.failure(error))
            } else {
                complition(.success(modelUser))
            }
        }
    }
}
