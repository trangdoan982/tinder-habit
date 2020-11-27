//
//  AppDelegate.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 11/21/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?

    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()

        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

    return true
  }

    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
}

extension AppDelegate: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        //handle sign-in errors
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
            print("error signing into Google \(error.localizedDescription)")
            }
        return
        }
        
        // Get credential object using Google ID token and Google access token
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
        
        // Authenticate with Firebase using the credential object
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("authentication error \(error.localizedDescription)")
            }
        }
    }
}

