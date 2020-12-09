//
//  NewMeetingViewController.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 12/3/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import Kingfisher
//import FirebaseDatabase


class NewMeetingViewController: UIViewController {
    var userHandler:UserHandler = UserHandler()
    let databaseRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userHandler.getAllUsers()

    }
    
    @IBAction func editMeeting(_ sender: Any) {
        self.performSegue(withIdentifier: "editMeeting", sender: self)
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
//    databaseRef.child(user.googleUserId).observeSingleEvent(of: .value, with: { snapshot in
//        guard let value = snapshot.value as? User else {
//            return
//        }
//        let imageUrl = value.profileImageUrl
//        print("image url is \(String(describing: imageUrl?.absoluteString))")
//    })
}
