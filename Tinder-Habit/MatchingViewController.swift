import UIKit
import Kingfisher
import Koloda


class MatchingViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate{
    @IBOutlet weak var kolodaView: KolodaView!
    
    
    var profileImageURLStrings: [String] = []
    var profileBio: [String] = []
    override func viewDidLoad() {
       super.viewDidLoad()
       profileImageURLStrings = [
         "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
         "https://images.pexels.com/photos/1121796/pexels-photo-1121796.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
         "https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
         "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
         "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
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
