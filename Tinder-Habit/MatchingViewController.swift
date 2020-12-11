//
//  MatchingViewController.swift
//  Tinder-Habit
//
//  Created by Brian Keane on 12/10/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import Koloda

class MatchingViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
  
//  var userHandler = FakeUserHandler()
  
  
    @IBOutlet weak var kolodaView: KolodaView!
    
  var potentialMatches: [User] = []
  var profileBio: [String] = []
  override func viewDidLoad() {
    super.viewDidLoad()
//    userHandler.getAllUsers { (users) in
      potentialMatches = users
       kolodaView.reloadData()
    }
    
    kolodaView.dataSource = self
    kolodaView.delegate = self
    
  }
  
  func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    // kolodaView.isHidden = true
    print("ran out of cards")
  }
  
  func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    let selectedUser = users[index]
    
//    userHandler.createMatch(userId1: selectedUser!.googleUserId) {
//      success in
//      print("successfully stored? \(success)")
//    }
  }
  
  func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
    return potentialMatches.count
  }
  
  func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
    return .fast
  }
  
  func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
    let imageView = UIImageView()
    let user = potentialMatches[index]
    imageView.kf.setImage(with: user.profileImageUrl)
    return imageView
  }
}
