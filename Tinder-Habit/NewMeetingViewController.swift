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


class NewMeetingViewController: UIViewController, PassDataDelegate {
    
    var profileImagePath: String = String()
    
    func passData(profileImageUrl: URL) {
        let url = profileImageUrl
        profileImagePath = url.absoluteString
    }
    
    var userHandler:UserHandler = UserHandler()
    let databaseRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userHandler.getAllUsers()
        let profileImageURL = URL(string: profileImagePath)
        profileImageView.kf.setImage(with: profileImageURL)
    }
    
    @IBAction func editMeeting(_ sender: Any) {
        self.performSegue(withIdentifier: "editMeeting", sender: self)
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    
}
