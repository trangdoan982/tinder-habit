//
//  DashboardViewController.swift
//  Tinder-Habit
//
//  Created by Brian Keane on 12/10/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import Koloda
import TinyConstraints
import Kingfisher
import Charts

class DashboardViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var userName: UILabel!
    
    
    @IBOutlet weak var bioText: UILabel!
    
    
    
  
  
  let userInfo:[String:String] = [
    "username": "Hello, Robert",
    "profileImageURL": "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
    "biotext" : "Robert wants to workout 4-5 days a week"
    
  ]
  
  
  lazy var lineChartView: LineChartView = {
    let chartView = LineChartView()
    chartView.backgroundColor = UIColor(displayP3Red: 1.0, green: 0.8, blue: 0.9, alpha: 0.5 )
    
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
      lineChartView.center(in: view, offset: CGPoint(x: 0, y: 63))
      
      lineChartView.width(350)
      lineChartView.height(250)
      
      setData()
    }

    
    
  func updateUI(){
    profileImage.kf.setImage(with: URL(string: self.userInfo["profileImageURL"]!))
    self.userName.text = userInfo["username"]
    self.bioText.text = userInfo["biotext"]
  }
  
  
  func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
    print(entry)
    
  }
  
  func setData(){
    let set1 = LineChartDataSet(entries: yValues, label: "Your Progress")
    
    // set1.mode = .cubicBezier
    set1.lineWidth = 2
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
}
