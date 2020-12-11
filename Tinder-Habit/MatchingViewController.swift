//
//  MatchingViewController.swift
//  Tinder-Habit
//
//  Created by Brian Keane on 12/10/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import Koloda
import Kingfisher


class MatchingViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  var profileImageURLStrings: [String] = []
  var profileBio: [String] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    profileImageURLStrings = [
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    ]
    
    kolodaView.dataSource = self
    kolodaView.delegate = self
    
  }
  
  func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    // kolodaView.isHidden = true
    print("ran out of cards")
  }
  
  func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    print("selected \(index)")
  }
  
  func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
    return profileImageURLStrings.count
  }
  
  func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
    return .fast
  }
  
  func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
    let imageView = UIImageView()
    let url = URL(string: profileImageURLStrings[index])
    imageView.kf.setImage(with: url)
    return imageView
  }
    
    @IBAction func xButtonTapped(_ sender: Any) {
        kolodaView.swipe(.left)
    }
    
    
    @IBAction func heartButtonTapped(_ sender: Any) {
        
        kolodaView.swipe(.right)
    }
    
    
    
}
