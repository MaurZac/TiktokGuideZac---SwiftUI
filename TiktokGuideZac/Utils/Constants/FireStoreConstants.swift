//
//  FireStoreConstants.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/28/24.
//

import FirebaseFirestore

struct FireStoreConstants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
}
