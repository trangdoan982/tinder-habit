//
//  UserModel.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 12/8/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import Foundation

struct User {
    var googleUserId: String!
    var profileImageUrl: URL?
    var fullName: String!
    
    init(googleUserId: String, profileImageUrl:URL, fullName:String) {
        self.googleUserId = googleUserId
        self.profileImageUrl = profileImageUrl
        self.fullName = fullName
    }
}
