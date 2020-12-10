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
import GoogleAPIClientForREST

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    private let scopes = [kGTLRAuthScopeCalendar]

    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()

        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        //Add scope
        
        GIDSignIn.sharedInstance()?.scopes = scopes
        
        
//        GIDSignIn.sharedInstance().delegate = self
        //ADD SCOPE HERE
        //Ref:https://stackoverflow.com/questions/38245484/ios-google-sign-in-not-getting-profile-scope
        
        //https://www.googleapis.com/auth/calendar
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

    return true
  }

    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
}
