//
//  EditNewMeetingController.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 12/5/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import DropDown
import GoogleAPIClientForREST
import GoogleSignIn

class EditNewMeetingController: UIViewController {
    
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Alex", "Ellie", "Trang", "Sadia", "Brian"]
        return menu
    }()
    
    @IBOutlet weak var buddySelection: UIView!
    @IBOutlet var buddyTap: UITapGestureRecognizer!
    @IBOutlet weak var chosenBuddy: UILabel!
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private let service = GTLRCalendarService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.anchorView = buddySelection
        
        buddyTap.numberOfTapsRequired = 1
        buddyTap.addTarget(self, action: #selector(didTapChooseBuddy))
        
        menu.selectionAction = { index, title in
            print("index \(index), title \(title)")
            self.chosenBuddy.text = title
        }
        
        createDatePicker()
        
    }
    
    @objc func didTapChooseBuddy() {
        menu.show()
    }
    
    
    
    @IBOutlet weak var pickTimeField: UITextField!
    let timePicker = UIDatePicker()
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneBtn], animated: true)
        
        pickTimeField.inputAccessoryView = toolbar
        pickTimeField.inputView = timePicker
        
        timePicker.datePickerMode = .dateAndTime
    }
    
    @objc func donePressed() {
        pickTimeField.text = "\(timePicker.date)"
        self.view.endEditing(true)
    }
    
    @IBAction func doneCreateNewMeeting(_ sender: Any) {
        //        addNewEventToGGCalendar(name: eventName.text!, time: pickTimeField.text!, description: descriptionTextView.text!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //    func addNewEventToGGCalendar(name: String, time:String, description:String ) {
    //        let calendarEvent = GTLRCalendar_Event()
    //
    //        calendarEvent.summary = name
    //        calendarEvent.descriptionProperty = description
    //        calendarEvent.organizer = GIDSignIn.sharedInstance()?.currentUser
    //
    //        let insertQuery = GTLRCalendarQuery_EventsInsert.query(withObject: calendarEvent, calendarId: "primary")
    //
    //        service.executeQuery(insertQuery) { (ticket, object, error) in
    //            if error == nil {
    //                print("Event inserted")
    //            } else {
    //                print("Error is \(error!)")
    //            }
    //        }
    //    }
    //
    
}
