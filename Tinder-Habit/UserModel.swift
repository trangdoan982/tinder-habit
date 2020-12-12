//
//  UserModel.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 12/8/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import Foundation

struct User {
    var googleUserId: String
    var profileImageUrl: String
    var fullName: String
    var bioText:String?
    
  init(googleUserId: String, profileImageUrl:String, fullName:String, bioText:String?) {
        self.googleUserId = googleUserId
        self.profileImageUrl = profileImageUrl
        self.fullName = fullName
        self.bioText = bioText
    }
}
