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


class LoginViewController: UIViewController {
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        // Do any additional setup xafter loading the view.
    }
    
}
