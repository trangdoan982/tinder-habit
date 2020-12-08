//
//  UserHandler.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 12/8/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import Foundation
import FirebaseDatabase

//temporary
var users:[User?] = []


class UserHandler {
    
    let databaseRef = Database.database().reference()
    
    func storeUser(user:User) -> User {
        //send to Firebase
//        users.append(user)
        
        databaseRef.child("\(String(describing: user.googleUserId))/profileImageUrl").setValue((user.profileImageUrl)?.absoluteString)
        databaseRef.child("\(String(describing: user.googleUserId))/fullName").setValue(user.fullName)
        return user
    }
    
    func getUser() -> [User] {
        //retrieve from Firebase
        return [User(googleUserId: "123", profileImageUrl: URL(string: "https://image.url")!, fullName: "Fake user")]
    }
    
    
}
