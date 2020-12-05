//
//  EditNewMeetingController.swift
//  Tinder-Habit
//
//  Created by Trang Doan on 12/5/20.
//  Copyright © 2020 Trang Doan. All rights reserved.
//

import UIKit
import DropDown

class EditNewMeetingController: UIViewController {
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Alex", "Ellie", "Trang", "Sadia", "Brian"]
        return menu
    }()
    
    @IBOutlet weak var buddySelection: UIView!
    @IBOutlet var buddyTap: UITapGestureRecognizer!
    @IBOutlet weak var chosenBuddy: UILabel!
    
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
        self.performSegue(withIdentifier: "doneCreateMeeting", sender: self)
    }
}
