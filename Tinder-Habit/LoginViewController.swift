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
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

            Auth.auth().signIn(with: credential, completion: { (user, error) -> Void in
                if error != nil {
                    print("Problem at signing in with google with error : \(String(describing: error))")
                }
                if user != nil {
                    self.performSegue(withIdentifier: "logInToHome", sender: self)
                    print("user successfully signed in through GOOGLE! user_id:\(Auth.auth().currentUser!.uid)")
                    print("signed in")
                }
            })
            
        }
    }

        
    @IBAction func googleBtnTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    // Get credential object using Google ID token and Google access token
//        guard let authentication = user.authentication else { return }
//
//        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
//                                                        accessToken: authentication.accessToken)
//
//        // Authenticate with Firebase using the credential object
//        Auth.auth().signIn(with: credential) { (authResult, error) in
//            if let error = error {
//                print("authentication error \(error.localizedDescription)")
//                }
//            }
//        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        GIDSignIn.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
        
        // check if the user is signed in

}
}
