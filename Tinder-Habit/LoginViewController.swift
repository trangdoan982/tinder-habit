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


class LoginViewController: UIViewController, GIDSignInDelegate {
    
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
            self.performSegue(withIdentifier: "logInToHome", sender: self)
        }
    }
    }
         
    @IBAction func googleBtnTapped(_ sender: Any) {
//        GIDSignIn.sharedInstance().signIn()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
        GIDSignIn.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
        
        // check if the user is signed in

}
}

