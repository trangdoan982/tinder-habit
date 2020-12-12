//
//  LoginViewController.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 11/27/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

protocol PassDataDelegate {
    func passData(profileImageUrl: URL) 
  
}
class LoginViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logInButton: GIDSignInButton!
    
    
    var userHandler:UserHandler = UserHandler()
    var profileImageUrl: String?
    var fullName: String?
    
    var logInSuccessful: Bool = false
    
    var delegate: PassDataDelegate?
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           GIDSignIn.sharedInstance()?.presentingViewController = self
           GIDSignIn.sharedInstance().delegate = self
        
        self.logoImageView.layer.cornerRadius = 30
        self.logInButton.layer.cornerRadius = 15
           
       }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Error is \(error.localizedDescription)")
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login successful")
                self.logInSuccessful = true
                //store the image
                if let currentUser = GIDSignIn.sharedInstance()?.currentUser {
                    self.profileImageUrl = currentUser.profile.imageURL(withDimension: 500)!.absoluteString
                    self.fullName = currentUser.profile.name!
                    let tinderHabitUser = User(googleUserId: currentUser.userID!, profileImageUrl: self.profileImageUrl!, fullName: self.fullName!, bioText: "")
                    
                    self.userHandler.storeUser(user: tinderHabitUser)
                    
                }
                
                self.performSegue(withIdentifier: "logInToHome", sender: self)
            }
        }
    }
    

   
}

