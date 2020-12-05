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

class NewMeetingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let user: GIDGoogleUser = GIDSignIn.sharedInstance()!.currentUser
//        let fullName = user.profile.name
//        let email = user.profile.email
//        if user.profile.hasImage {
//        let userDP = user.profile.imageURL(withDimension: 200)
//            self.sampleImageView.sd_setImage(with: userDP, placeholderImage: UIImage(named: "default-profile”))
//        } else {
//            self.sampleImageView.image = UIImage(named: "default-profile”)
//        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editMeeting(_ sender: Any) {
        self.performSegue(withIdentifier: "editMeeting", sender: self)
    }
    
//    @IBAction func signOut(_ sender: Any) {
//        let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//          print ("Error signing out: %@", signOutError)
//        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
//
}
