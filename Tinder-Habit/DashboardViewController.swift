import UIKit
import Kingfisher
import Charts
import TinyConstraints

class DashboardViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var newMeetingButton: UIButton!
    @IBOutlet weak var bioTextField: UITextView!
    
    
    
    var userhandler:UserHandler = UserHandler()
    
    let userInfo:[String:String] = [
      "username": "Hello, Celine",
      "profileImageURL": "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-picture-natural-light.jpg"
    ]
    
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = UIColor(red: 1, green: 0.9765, blue: 0.9176, alpha: 1.0)
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(3, force: false)
        yAxis.labelTextColor = .black
        yAxis.axisLineColor = .black
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .black
        
        chartView.animate(xAxisDuration: 4.0)
  
        return chartView
    }()
    

    override func viewDidLoad() {
          super.viewDidLoad()
          updateUI()
        view.addSubview(lineChartView)
        lineChartView.center(in: view, offset: CGPoint(x: 0, y: 70))
        
        lineChartView.width(370)
        lineChartView.height(270)
        
        setData()
        
        newMeetingButton.layer.cornerRadius = 10
        
      }
    
    func updateUI(){
        userhandler.getCurrentUser { (user) in
            let profileImageURL = URL(string: user.profileImageUrl)
            self.profileImage.kf.setImage(with: profileImageURL)
            self.userName.text = user.fullName
            self.bioTextField.text = "Hi there, it's \(user.fullName), trying to build a new habit"
            self.profileImage.setRounded()
        }
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
        
    }
    
    func setData(){
        let set1 = LineChartDataSet(entries: yValues, label: "Your Progress")
        
       // set1.mode = .cubicBezier
        set1.lineWidth = 1.5
        set1.setColor(.black)
        set1.setCircleColor(.black)
        set1.circleRadius = 5
        set1.circleHoleRadius = 2
        set1.circleHoleColor = .white
        
        let data = LineChartData(dataSet: set1)
        lineChartView.data = data
    }

    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 1.0),
        ChartDataEntry(x: 1.0, y: 5.0),
        ChartDataEntry(x: 2.0, y: 10.0),
        ChartDataEntry(x: 4.0, y: 12.0),
        ChartDataEntry(x: 6.0, y: 15.0),
        ChartDataEntry(x: 8.3, y: 17.0),
        ChartDataEntry(x: 10.2, y: 12.0),
        ChartDataEntry(x: 15.2, y: 20.3),
        ChartDataEntry(x: 20.0, y: 23.0),
        ChartDataEntry(x: 25.0, y: 25.0),
        ChartDataEntry(x: 29.0, y: 30.1)
    ]


    //Edit new meeting with a buddy
    @IBAction func createNewMeetingButton(_ sender: Any) {
        performSegue(withIdentifier: "editMeeting", sender: self)
    }
    
}

extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}
