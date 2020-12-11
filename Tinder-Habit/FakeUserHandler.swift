//
//  FakeUserHandler.swift
//  Tinder-Habit
//
//  Created by Brian Keane on 12/10/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit

class FakeUserHandler: UserHandler {
  overrid func getAllUsers(closure: ([User]) -> Void) {
    closure(
      [
      User(googleUserId: "1",
           profileImageUrl: URL(string: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
           fullName: "Bob",
           bioText: "Some Dude")
      ]
    )
  }
  
  func storeUser(user: User, closure: (Bool) -> Void) {
    closure(true)
  }
  
  func createMatch(userID1:String, userID2:String, closure: (Bool) -> Void) {
    closure(true)
  }
  
  func getCurrentUser() -> User {
    return User(googleUserId: "1", profileImageUrl: URL(string: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"), fullName: "Bob", bioText: "Awesome Dude.")
    }
}



//      "https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//      "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//      "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
